import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mipueblo_app/Constants/Colors/app_colors.dart';
import 'package:mipueblo_app/Constants/SizedBoxExtension/sizedbox_extension.dart';
import 'package:mipueblo_app/Views/Auth/signup_screen.dart';
import 'package:mipueblo_app/Widgets/app_button.dart';
import 'package:mipueblo_app/Widgets/app_social_button.dart';
import 'package:mipueblo_app/Widgets/app_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.h.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.ph,
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              60.ph,
              Text(
                "Email",
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              10.ph,
              AppTextField(
                hintText: "Enter your Email",
                icon: Icon(Icons.check_circle, color: AppColors.lightGreyColor),
                controller: TextEditingController(),
              ),
              20.ph,
              Text(
                "Password",
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              10.ph,
              AppTextField(
                hintText: "Enter your Password",
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.lightGreyColor,
                ),
                obscureText: !_isPasswordVisible,
                onIconTap: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
                controller: TextEditingController(),
              ),
              40.ph,
              AppButton(height: 50.h, text: "Sign In", onPressed: () {}),
              40.ph,
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.lightGreyColor.withOpacity(0.3),
                        thickness: 1.0,
                        height: 20.h,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Text(
                        "or sign in with",
                        style: TextStyle(
                          color: AppColors.lightGreyColor,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.lightGreyColor.withOpacity(0.3),
                        thickness: 1.0,
                        height: 20.h,
                      ),
                    ),
                  ],
                ),
              ),
              30.ph,
              Row(
                children: [
                  Expanded(
                    child: AppSocialButton(
                      assetName: "assets/Images/facebook_icon.png",
                      onPressed: () {},
                      text: 'Facebook',
                    ),
                  ),
                  10.pw, // Spacing between buttons
                  Expanded(
                    child: AppSocialButton(
                      assetName: "assets/Images/google_icon.png",
                      onPressed: () {},
                      text: 'Google',
                    ),
                  ),
                ],
              ),
              Spacer(),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Don’t have an account? ",
                        style: TextStyle(
                          color: AppColors.lightGreyColor,
                          fontSize: 14.sp,
                        ),
                      ),
                      TextSpan(
                        text: "Sign Up",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
