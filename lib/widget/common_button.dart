import 'package:flutter/material.dart';
import 'package:riverpod_demo/utils/app_colors.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CommonButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.primaryColor,
        ),
        margin: EdgeInsets.symmetric(horizontal: 70),
        width: MediaQuery.of(context).size.width,
        height: 45,
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            letterSpacing: 0.8,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
