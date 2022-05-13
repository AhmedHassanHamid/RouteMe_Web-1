import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:web/business_logic/app_cubit/app_cubit.dart';
import 'package:web/business_logic/app_cubit/app_state.dart';
import 'package:web/business_logic/bloc_observer.dart';
import 'package:web/business_logic/dispatchers_cubit/dispatchers_cubit.dart';
import 'package:web/business_logic/drivers_cubit/drivers_cubit.dart';
import 'package:web/business_logic/edit_user_cubit/edit_user_cubit.dart';
import 'package:web/business_logic/language_cubit/language_cubit.dart';
import 'package:web/business_logic/login_cubit/login_cubit.dart';
import 'package:web/business_logic/orders_cubit/orders_cubit.dart';
import 'package:web/business_logic/reset_password_cubit/reset_password_cubit.dart';
import 'package:web/business_logic/tasks_cubit/tasks_cubit.dart';
import 'package:web/business_logic/vendor_cubit/vendors_cubit.dart';
import 'package:web/business_logic/verify_cubit/verify_cubit.dart';
import 'package:web/data/remote/dio_helper.dart';
import 'business_logic/delete_user_cubit/delete_user_cubit.dart';
import 'data/local/cache_helper.dart';
import 'presentation/router/app_router.dart';
import 'presentation/styles/colors.dart';

late LocalizationDelegate delegate;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
        () async {
      DioHelper.init();
      await CacheHelper.init();
      final locale =
          CacheHelper.getDataFromSharedPreference(key: 'language') ?? "ar";
      delegate = await LocalizationDelegate.create(
        fallbackLocale: locale,
        supportedLocales: ['ar', 'en'],
      );
      await delegate.changeLocale(Locale(locale));
      runApp(MyApp(
        appRouter: AppRouter(),
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatefulWidget {
  final AppRouter appRouter;

  const MyApp({
    required this.appRouter,
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Intl.defaultLocale = delegate.currentLocale.languageCode;

    delegate.onLocaleChanged = (Locale value) async {
      try {
        setState(() {
          Intl.defaultLocale = value.languageCode;
        });
      } catch (e) {
        //print(e.toString());
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ((context) => AppCubit()),
        ),
        BlocProvider(
          create: ((context) => LoginCubit()),
        ),
        BlocProvider(
          create: ((context) => VerifyCubit()),
        ),
        BlocProvider(
          create: ((context) => ResetPasswordCubit()),
        ),
        BlocProvider(
          create: ((context) => LanguageCubit()),
        ),
        BlocProvider(
          create: ((context) => DeleteUserCubit()),
        ),
        BlocProvider(
          create: ((context) => EditUserCubit()),
        ),
        BlocProvider(
          create: ((context) => OrderCubit()..myOrders),
        ),
        BlocProvider(
          create: ((context) => TasksCubit()..myTasks),
        ),
        BlocProvider(
          create: ((context) => DriversCubit()..myDrivers),
        ),
        BlocProvider(
          create: ((context) => DispatchersCubit()..myDispatchers),
        ),
        BlocProvider(
          create: ((context) => VendorsCubit()..myVendors),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Sizer(
            builder: (context, orientation, deviceType) {
              return LocalizedApp(
                delegate,
                LayoutBuilder(builder: (context, constraints) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Route Me',
                    localizationsDelegates: [
                      GlobalCupertinoLocalizations.delegate,
                      DefaultCupertinoLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      delegate,
                    ],
                    locale: delegate.currentLocale,
                    supportedLocales: delegate.supportedLocales,
                    onGenerateRoute: widget.appRouter.onGenerateRoute,
                    theme: ThemeData(
                      fontFamily: 'cairo',
                      scaffoldBackgroundColor: AppColors.white,
                      appBarTheme: const AppBarTheme(
                        elevation: 0.0,
                        systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarColor: AppColors.transparent,
                          statusBarIconBrightness: Brightness.dark,
                        ),
                      ),
                    ),
                  );
                }),
              );
            },
          );
        },
      ),
    );
  }
}
