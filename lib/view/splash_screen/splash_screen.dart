import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:riverpod_demo/utils/app_assets.dart';
import 'package:riverpod_demo/view/signin_screen/signin_screen.dart';
import 'package:riverpod_demo/widget/base_widget.dart';

class SplashPage extends BaseConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Timer(Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return SignInPage();
        }),
      );
    });

    return Scaffold(
      body: Lottie.asset(AppAssets.splashImage),
    );
  }
}
