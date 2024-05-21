import 'package:carbon_emissions/introduction_screen.dart';
import 'package:carbon_emissions/theme/colors.dart';
import 'package:carbon_emissions/utils/route_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg_white.png'),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsets.all(32.r),
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 162.h,
                height: 46.h,
              ),
              const Spacer(),
              Column(
                children: [
                  Text(
                    'WELCOME TO',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 40.sp,
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    'CARCULATOR CARBON NETURAL',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 64.sp,
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(645.w, 85.h),
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            RouteUtils()
                                .createRoute(const IntroductionScreen()));
                      },
                      child: Text(
                        'START',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32.sp,
                        ),
                      )),
                ],
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
