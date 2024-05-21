import 'package:carbon_emissions/theme/colors.dart';
import 'package:carbon_emissions/tutorial_screen.dart';
import 'package:carbon_emissions/utils/route_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(62.h),
        child: AppBar(
          centerTitle: true,
          forceMaterialTransparency: true,
          title: Padding(
            padding: EdgeInsets.only(top: 24.h),
            child: Image.asset('assets/images/logo.png',
                width: 161.w, height: 45.h),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg_white.png'),
              fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 230.w),
              child: Container(
                padding: EdgeInsets.all(50.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'INTRODUCTION',
                      style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Text(
                      'WELCOME TO CARBON NEUTRAL SIMULATION FOR SCOPE OF 3 PRODUCTS. IN THIS SIMULATION, WE CHALLENGE YOU TO BE ABLE TO DESIGN A STRATEGY TO FORMULATE THE xEV RATIO OF PRODUCT SALES ALONG WITH ITS ENERGY SOURCES TO ACHIEVE THE TARGET OF ZERO EMISSIONS',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(296.w, 85.h),
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              RouteUtils().createRoute(const TutorialScreen()));
                        },
                        child: Text(
                          'NEXT',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32.sp,
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
