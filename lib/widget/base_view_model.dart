// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:riverpod_demo/utils/app_strings.dart';

abstract class BaseViewModel extends ChangeNotifier {
  void showProgressLoading() {
    EasyLoading.show(status: AppStrings.pleaseWait);
  }

  void dismissProgressLoading() {
    EasyLoading.dismiss(animation: true);
  }

  void showSuccessToast(
      {required BuildContext context, required String description}) {
    if (context == null) {
      return;
    }
    MotionToast.success(
      title: null,
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.75,
        minWidth: 200,
        maxHeight: 80,
      ),
      position: MotionToastPosition.bottom,
      description: Text(
        description,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
      toastDuration: const Duration(seconds: 3),
    ).show(context);
  }

  void showErrorToast(
      {required BuildContext context,
      required String description,
      required String title}) {
    MotionToast.error(
            title: Text(title),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75,
              minWidth: 200,
              maxHeight: 80,
            ),
            position: MotionToastPosition.bottom,
            description: Text(
              description,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            toastDuration: const Duration(seconds: 3))
        .show(context);
  }
}
