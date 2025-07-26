import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mipueblo_app/Constants/Colors/app_colors.dart';
import 'package:mipueblo_app/Constants/SizedBoxExtension/sizedbox_extension.dart';

class AppSocialButton extends StatelessWidget {
  final String assetName;
  final VoidCallback? onPressed;
  final String text;

  const AppSocialButton({
    super.key,
    required this.assetName,
    this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.lightGreyColor.withValues(alpha: 0.3),
          ),
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.h.w),
          child: Row(
            children: [
              Image.asset(assetName, height: 24.h, width: 24.w),
              15.pw,
              Text(
                text,
                style: TextStyle(color: AppColors.textColor, fontSize: 14.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
