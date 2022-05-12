import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:web/presentation/styles/colors.dart';
import 'package:web/presentation/view/language_dialog.dart';
import 'package:web/presentation/view/logout_dialog.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.darkGray,
              ),
            ),
          ),
          const SizedBox(
            height: 150,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.map_outlined,
              color: AppColors.darkGray,
            ),
            title: Text(
              translate("home"),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.darkGray,
            ),
          ),
          ListTile(
            onTap: () => Navigator.pushNamed(context, '/tasks'),
            leading: const Icon(
              Icons.assignment_turned_in_outlined,
              color: AppColors.darkGray,
            ),
            title: Text(
              translate("tasks"),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.darkGray,
            ),
          ),
          ListTile(
            onTap: () => Navigator.pushNamed(context, '/orders'),
            leading: const Icon(
              Icons.shopping_bag_outlined,
              color: AppColors.darkGray,
            ),
            title: Text(
              translate("orders"),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.darkGray,
            ),
          ),
          ListTile(
            onTap: () => Navigator.pushNamed(context, '/dispatchers'),
            leading: const Icon(
              Icons.support_agent_outlined,
              color: AppColors.darkGray,
            ),
            title: Text(
              translate("dispatchers"),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.darkGray,
            ),
          ),
          ListTile(
            onTap: () => Navigator.pushNamed(context, '/drivers'),
            leading: const Icon(
              Icons.directions_car,
              color: AppColors.darkGray,
            ),
            title: Text(
              translate("drivers"),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.darkGray,
            ),
          ),
          ListTile(
            onTap: () => Navigator.pushNamed(context, '/vendors'),
            leading: const Icon(
              Icons.store_mall_directory_outlined,
              color: AppColors.darkGray,
            ),
            title: Text(
              translate("vendors"),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.darkGray,
            ),
          ),
          ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) {
                  return const LanguageDialog();
                },
              );
            },
            leading: const Icon(
              Icons.language,
              color: AppColors.darkGray,
            ),
            title: Text(
              translate("language"),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.darkGray,
            ),
          ),
          ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) {
                  return const LogoutDialog();
                },
              );
            },
            leading: const Icon(
              Icons.logout,
              color: AppColors.darkGray,
            ),
            title: Text(
              translate("logout"),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.darkGray,
            ),
          ),
        ],
      ),
    );
  }
}
