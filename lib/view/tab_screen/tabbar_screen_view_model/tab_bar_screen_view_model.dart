import 'package:riverpod_demo/widget/base_view_model.dart';

class TabBarScreenViewModel extends BaseViewModel {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
