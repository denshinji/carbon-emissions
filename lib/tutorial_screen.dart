import 'package:carbon_emissions/calculator_screen.dart';
import 'package:carbon_emissions/theme/colors.dart';
import 'package:carbon_emissions/utils/route_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TutorialScreen extends StatelessWidget {
  const TutorialScreen({super.key});

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
          child: Padding(
            padding: EdgeInsets.all(52.r),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 82.w,
                      vertical: 52.h,
                    ),
                    child: Row(
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'INTRODUCTION',
                                style: TextStyle(
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              Text(
                                'INPUT YOUR SALES RATIO xEV PLAN BY COMBINED WITH MORE ECO-FRIENDLY ENERGY SOURCES',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 24.h,
                        ),
                        Image.asset(
                          'assets/images/game_rules.png',
                          width: 490.w,
                          height: 210.h,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 82.w,
                      vertical: 52.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'HOW TO WIN',
                                style: TextStyle(
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              Text(
                                'IF YOU ABLE TO ACHIEVE CARBON NEUTRAL TARGET :\n1.Average Tank to Wheel : 119 gr/km @2030.\n2.Average Well to Wheel : 107 gr/km @2030.\n3.Annual emission flat from 2030 onward',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 24.w,
                        ),
                        Image.asset(
                          'assets/images/chart_rules.png',
                          width: 490.w,
                          height: 210.h,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
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
                          RouteUtils().createRoute(const CalculatorScreen()));
                    },
                    child: Text(
                      'GO',
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
    );
  }
}
