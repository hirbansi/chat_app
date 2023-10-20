import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/core/provider/view_model_provider.dart';
import 'package:riverpod_demo/utils/app_strings.dart';
import 'package:riverpod_demo/widget/base_view_model.dart';

class SignInScreenViewModel extends BaseViewModel {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  signIn({required BuildContext context, required WidgetRef ref}) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  CircularProgressIndicator(),
                ]),
          );
        });

    try {
      await ref.read(apiProviderViewModel).createEmailSession(
            email: emailController.text,
            password: passwordController.text,
          );

      Navigator.pop(context);
    } on AppwriteException catch (e) {
      Navigator.pop(context);

      showAlert(
          title: AppStrings.loginFailed,
          text: e.message.toString(),
          context: context);
    }
  }

  showAlert(
      {required String title,
      required String text,
      required BuildContext context}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(text),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Ok'))
            ],
          );
        });
  }
}
