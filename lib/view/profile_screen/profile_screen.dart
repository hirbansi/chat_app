import 'package:flutter/material.dart';
import 'package:riverpod_demo/widget/base_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends BaseConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          color: Colors.red,
        ),
      ),
    );
  }
}
