import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mipueblo_app/Constants/Colors/app_colors.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final Widget? icon;
  final TextEditingController? controller;
  final bool obscureText;
  final VoidCallback? onIconTap;

  const AppTextField({
    Key? key,
    required this.hintText,
    this.icon,
    this.controller,
    this.obscureText = false,
    this.onIconTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.filledColor,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: AppColors.lightGreyColor),
          suffixIcon: icon != null
              ? GestureDetector(onTap: onIconTap, child: icon)
              : null,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 14.h,
          ),
        ),
      ),
    );
  }
}
