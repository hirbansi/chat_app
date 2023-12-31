import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_demo/core/provider/view_model_provider.dart';
import 'package:riverpod_demo/utils/app_colors.dart';
import 'package:riverpod_demo/utils/app_strings.dart';
import 'package:riverpod_demo/utils/validator.dart';
import 'package:riverpod_demo/view/sign_up_screen/signup_screen.dart';
import 'package:riverpod_demo/widget/common_button.dart';
import 'package:riverpod_demo/widget/text_form_field.dart';
import 'package:riverpod_demo/widget/base_widget.dart';

class SignInPage extends BaseConsumerWidget {
  SignInPage({super.key});

  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.signIn,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      letterSpacing: .5),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 30),
                  child: FittedBox(
                    child: Text(
                      AppStrings.loginCredentials,
                      style: TextStyle(fontSize: 14, letterSpacing: .8),
                    ),
                  ),
                ),
                CommonTextFormField(
                  inputType: TextInputType.emailAddress,
                  hintText: AppStrings.enterEmail,
                  autofillHints: <String>[AutofillHints.email],
                  controller:
                      ref.watch(signInScreenViewModelProvider).emailController,
                  validator: AppValidators.emailValidator,
                  submitted: false,
                  textInputAction: TextInputAction.next,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: CommonTextFormField(
                    inputType: TextInputType.visiblePassword,
                    hintText: AppStrings.enterPassword,
                    autofillHints: const <String>[AutofillHints.password],
                    controller: ref
                        .watch(signInScreenViewModelProvider)
                        .passwordController,
                    validator: AppValidators.passwordValidator,
                    obscure: true,
                    textInputAction: TextInputAction.next,
                    submitted: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: CommonButton(
                    title: AppStrings.signIn,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        ref
                            .watch(signInScreenViewModelProvider)
                            .signIn(context: context, ref: ref);
                      } else {}
                    },
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: AppStrings.dontHaveAnAccount,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          )),
                      TextSpan(
                        text: ' ${AppStrings.signUp}',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.blueColor,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return SignUpPage();
                                },
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
