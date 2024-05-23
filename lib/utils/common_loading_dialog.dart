import 'dart:async';

import 'package:carbon_emissions/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingDialog extends StatelessWidget {
  final String? message;
  final EdgeInsetsGeometry? margin;
  final double? width;
  const LoadingDialog({
    super.key,
    this.message,
    this.margin,
    this.width,
  });

  static Future showLoadingDialog(
    BuildContext context, [
    bool rootNavigator = false,
    String? message,
    EdgeInsetsGeometry? margin,
    double? width,
  ]) {
    return showDialog(
      context: context,
      useRootNavigator: rootNavigator,
      barrierDismissible: false,
      builder: (context) => LoadingDialog(
        message: message,
        margin: margin,
        width: width,
      ),
    );
  }

  static Future<T> runWithLoading<T>(
    BuildContext context,
    Future<T> Function() block, {
    String? message,
    EdgeInsetsGeometry? margin,
    double? width,
  }) async {
    try {
      unawaited(showLoadingDialog(
        context,
        true,
        message,
        margin,
        width,
      ));
      final result = await block();
      return result;
    } finally {
      if (context.mounted) {
        Navigator.of(context, rootNavigator: true).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.primaryColor,
        ),
        width: width ?? 200,
        height: 150,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const CircularProgressIndicator(),
            Text(
              message ?? 'Loading',
              style: TextStyle(fontSize: 12.sp, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
