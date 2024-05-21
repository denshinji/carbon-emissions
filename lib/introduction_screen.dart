import 'package:carbon_emissions/theme/colors.dart';
import 'package:carbon_emissions/tutorial_screen.dart';
import 'package:carbon_emissions/utils/route_animation.dart';
import 'package:flutter/material.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(62),
        child: AppBar(
          centerTitle: true,
          forceMaterialTransparency: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 24),
            child:
                Image.asset('assets/images/logo.png', width: 161, height: 45),
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
              padding: const EdgeInsets.symmetric(horizontal: 230),
              child: Container(
                padding: const EdgeInsets.all(50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'INTRODUCTION',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    const Text(
                      'WELCOME TO CARBON NEUTRAL SIMULATION FOR SCOPE OF 3 PRODUCTS. IN THIS SIMULATION, WE CHALLENGE YOU TO BE ABLE TO DESIGN A STRATEGY TO FORMULATE THE xEV RATIO OF PRODUCT SALES ALONG WITH ITS ENERGY SOURCES TO ACHIEVE THE TARGET OF ZERO EMISSIONS',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(296, 85),
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              RouteUtils().createRoute(const TutorialScreen()));
                        },
                        child: const Text(
                          'NEXT',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
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
