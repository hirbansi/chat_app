import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_demo/utils/app_colors.dart';
import 'package:riverpod_demo/utils/app_strings.dart';
import 'package:riverpod_demo/utils/validator.dart';
import 'package:riverpod_demo/view/signin_screen/signin_screen.dart';
import 'package:riverpod_demo/widget/common_button.dart';
import 'package:riverpod_demo/widget/text_form_field.dart';
import 'package:riverpod_demo/widget/base_widget.dart';

class SignUpPage extends BaseConsumerWidget {
  SignUpPage({super.key});

  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _confirmPasswordController = TextEditingController();

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
                  AppStrings.signUp,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      letterSpacing: .5),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 30),
                  child: FittedBox(
                    child: Text(
                      AppStrings.createAnAccount,
                      style: TextStyle(fontSize: 14, letterSpacing: .8),
                    ),
                  ),
                ),
                CommonTextFormField(
                  inputType: TextInputType.emailAddress,
                  hintText: AppStrings.enterEmail,
                  autofillHints: <String>[AutofillHints.email],
                  controller: _emailController,
                  validator: AppValidators.emailValidator,
                  submitted: false,
                  obscure: true,
                  textInputAction: TextInputAction.next,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: CommonTextFormField(
                    inputType: TextInputType.visiblePassword,
                    hintText: AppStrings.enterPassword,
                    autofillHints: const <String>[AutofillHints.password],
                    controller: _passwordController,
                    validator: AppValidators.passwordValidator,
                    submitted: false,
                    obscure: true,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                CommonTextFormField(
                  inputType: TextInputType.visiblePassword,
                  hintText: AppStrings.enterConfirmPassword,
                  autofillHints: const [AutofillHints.password],
                  controller: _confirmPasswordController,
                  obscure: true,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    return AppValidators.confirmPasswordValidator(
                      _confirmPasswordController.text,
                      _passwordController.text,
                    );
                  },
                  submitted: false,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: CommonButton(
                    title: AppStrings.signUp,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                      } else {}
                    },
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: AppStrings.alreadyHaveAnAccount,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          )),
                      TextSpan(
                        text: ' ${AppStrings.signIn}',
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
                                  return SignInPage();
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
