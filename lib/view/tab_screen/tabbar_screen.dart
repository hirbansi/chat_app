import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/core/provider/view_model_provider.dart';
import 'package:riverpod_demo/view/home_screen/home_screen.dart';
import 'package:riverpod_demo/view/profile_screen/profile_screen.dart';
import 'package:riverpod_demo/widget/base_widget.dart';

class TabBarPage extends BaseConsumerWidget {
  const TabBarPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _widgets = [HomePage(), ProfilePage()];

    return Scaffold(
      body: _widgets
          .elementAt(ref.watch(tabBarScreenViewModelProvider).selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.message_outlined), label: "Message"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: "Profile")
        ],
        currentIndex: ref.watch(tabBarScreenViewModelProvider).selectedIndex,
        onTap: (value) {
          ref.watch(tabBarScreenViewModelProvider).onItemTapped(value);
        },
      ),
    );
  }
}
