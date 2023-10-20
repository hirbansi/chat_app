import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_demo/widget/base_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/api_provider/api_provider.dart';
import 'package:riverpod_demo/view/tab_screen/tabbar_screen.dart';
import 'package:riverpod_demo/view/signin_screen/signin_screen.dart';
import 'package:riverpod_demo/core/provider/view_model_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setAppOverlay();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends BaseConsumerWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch<ApiProviderViewModel>(apiProviderViewModel).status;

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: value == AuthStatus.authenticated ? TabBarPage() : SignInPage(),
    );
  }
}

Future<void> setAppOverlay() async {
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  ); //
}
