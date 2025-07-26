import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mipueblo_app/Constants/Colors/app_colors.dart';
import 'package:mipueblo_app/Constants/SizedBoxExtension/sizedbox_extension.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        100.ph,
        SizedBox(
          height: 420.h,
          width: double.infinity.w,
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
        30.ph,
        Text(
          title,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.2,
            color: AppColors.textColor,
          ),
          textAlign: TextAlign.center,
        ),
        20.ph,
        Text(
          description,
          style: TextStyle(fontSize: 16.sp, color: AppColors.lightGreyColor),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
