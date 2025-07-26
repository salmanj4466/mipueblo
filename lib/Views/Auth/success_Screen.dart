import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mipueblo_app/Constants/Colors/app_colors.dart';
import 'package:mipueblo_app/Constants/SizedBoxExtension/sizedbox_extension.dart';
import 'package:mipueblo_app/Views/Auth/login_screen.dart';
import 'package:mipueblo_app/Widgets/app_button.dart';

class SignUpSuccessScreen extends StatelessWidget {
  const SignUpSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.h.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              250.ph,
              Icon(Icons.check_circle, color: AppColors.textColor, size: 80.sp),
              40.ph,
              Text(
                "Done",
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),
              20.ph,
              Text(
                "You have successfully completed\nyour registration",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.lightGreyColor,
                  fontSize: 14.sp,
                ),
              ),
              Spacer(),
              AppButton(
                height: 50.h,
                text: "Sign In",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
