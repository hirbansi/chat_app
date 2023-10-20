import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_demo/api_provider/api_provider.dart';
import 'package:riverpod_demo/view/sign_up_screen/signup_screen_view_model/signup_screen_view_model.dart';
import 'package:riverpod_demo/view/signin_screen/signin_screen_view_model/signin_screen_view_model.dart';
import 'package:riverpod_demo/view/tab_screen/tabbar_screen_view_model/tab_bar_screen_view_model.dart';

final apiProviderViewModel =
    ChangeNotifierProvider((ref) => ApiProviderViewModel());

final tabBarScreenViewModelProvider =
    ChangeNotifierProvider((ref) => TabBarScreenViewModel());

final signInScreenViewModelProvider =
    ChangeNotifierProvider((ref) => SignInScreenViewModel());

final signUpScreenViewModelProvider =
    ChangeNotifierProvider((ref) => SignUpScreenViewModel());
