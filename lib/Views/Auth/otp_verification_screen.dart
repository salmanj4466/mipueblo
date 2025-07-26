import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mipueblo_app/Constants/Colors/app_colors.dart';
import 'package:mipueblo_app/Constants/SizedBoxExtension/sizedbox_extension.dart';
import 'package:mipueblo_app/Views/Auth/success_Screen.dart';
import 'package:mipueblo_app/Widgets/app_button.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty && index < _focusNodes.length - 1) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }
  }

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: AppColors.textColor),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 48.w),
                ],
              ),
              60.ph,
              Center(
                child: Text(
                  "Verification",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                ),
              ),
              10.ph,
              Center(
                child: Text(
                  "Enter the 4-digit code sent to\nyour phone number",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.lightGreyColor,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              40.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return SizedBox(
                    width: 50.w,
                    child: TextField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      onChanged: (value) => _onChanged(value, index),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      style: TextStyle(fontSize: 20.sp),
                      decoration: InputDecoration(
                        counterText: "",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.lightGreyColor,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.primaryColor),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              20.ph,
              Center(
                child: Text(
                  "I didn't receive the code",
                  style: TextStyle(
                    color: AppColors.lightGreyColor,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              5.ph,
              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Resend code",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              50.ph,
              AppButton(
                height: 50.h,
                text: "Verify",
                onPressed: () {
                  bool isVerified = true;

                  if (isVerified) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpSuccessScreen(),
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
