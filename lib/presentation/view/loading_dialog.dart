import 'package:flutter/material.dart';
import 'package:web/presentation/styles/colors.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.transparent,
      body: Center(
        child: CircularProgressIndicator(
          color: AppColors.purple,
        ),
      ),
    );
  }
}
