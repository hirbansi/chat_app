import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:riverpod_demo/utils/app_strings.dart';

abstract class BaseConsumerWidget extends ConsumerWidget {
  const BaseConsumerWidget({Key? key}) : super(key: key);

  void showSuccessToast(
      {required BuildContext context, required String description}) {
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
            toastDuration: const Duration(seconds: 3))
        .show(context);
  }

  void showErrorToast(
      {required BuildContext context, required String description}) {
    MotionToast.error(
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
            toastDuration: const Duration(seconds: 3))
        .show(context);
  }

  void showProgressLoading() {
    EasyLoading.show(status: AppStrings.pleaseWait);
  }

  void dismissProgressLoading() {
    EasyLoading.dismiss(animation: true);
  }
}
