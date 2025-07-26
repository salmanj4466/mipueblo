import 'package:flutter/material.dart';
import 'package:mipueblo_app/Constants/Colors/app_colors.dart';
import 'package:mipueblo_app/Constants/Images/app_images.dart';
import 'package:mipueblo_app/Views/Auth/login_screen.dart';
import 'package:mipueblo_app/Views/OnboardingScreen/onboarding_page.dart';
import 'package:mipueblo_app/Widgets/app_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  int currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Biggest Sell at Your\nFingerprint",
      "description":
          "Find your best products from popular\nshop without any delay",
      "image": AppImages.onboardingOne,
    },
    {
      "title": "Pay Secure Payment\nGateway",
      "description":
          "Find your best products from popular\nshop without any delay",
      "image": AppImages.onboardingTwo,
    },
    {
      "title": "Get Faster and Safe\nDelivery",
      "description":
          "Find your best products from popular\nshop without any delay",
      "image": AppImages.onboardingThree,
    },
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  void nextPage() {
    if (currentPage < onboardingData.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  void skipToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Stack(
          children: [
            PageView.builder(
              onPageChanged: onPageChanged,
              controller: pageController,
              itemCount: onboardingData.length,
              itemBuilder: (context, index) {
                return OnboardingPage(
                  title: onboardingData[index]['title']!,
                  description: onboardingData[index]['description']!,
                  imagePath: onboardingData[index]['image']!,
                );
              },
            ),
            Positioned(
              bottom: 20.0,
              left: 16.0,
              right: 16.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: skipToLogin,
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardingData.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        width: currentPage == index ? 12.0 : 8.0,
                        height: currentPage == index ? 12.0 : 8.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentPage == index
                              ? AppColors.primaryColor
                              : AppColors.primaryColor.withValues(alpha: 0.4),
                        ),
                      ),
                    ),
                  ),
                  AppButton(
                    text: currentPage == onboardingData.length - 1
                        ? 'Get Started'
                        : 'Next',
                    onPressed: nextPage,
                    width: currentPage == onboardingData.length - 1
                        ? 120.0
                        : 80.0, // Wider for "Get Started"
                    height: 40.0, // Override default 28.h
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
