import 'package:carbon_emissions/calculator_screen.dart';
import 'package:carbon_emissions/theme/colors.dart';
import 'package:carbon_emissions/utils/route_animation.dart';
import 'package:flutter/material.dart';

class TutorialScreen extends StatelessWidget {
  const TutorialScreen({super.key});

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
          child: Padding(
            padding: const EdgeInsets.all(52.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 82,
                      vertical: 52,
                    ),
                    child: Row(
                      children: [
                        const Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'INTRODUCTION',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                'INPUT YOUR SALES RATIO xEV PLAN BY COMBINED WITH MORE ECO-FRIENDLY ENERGY SOURCES',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        Image.asset(
                          'assets/images/game_rules.png',
                          width: 490,
                          height: 210,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 82,
                      vertical: 52,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'HOW TO WIN',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                'IF YOU ABLE TO ACHIEVE CARBON NEUTRAL TARGET :\n1.Average Tank to Wheel : 119 gr/km @2030.\n2.Average Well to Wheel : 107 gr/km @2030.\n3.Annual emission flat from 2030 onward',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        Image.asset(
                          'assets/images/chart_rules.png',
                          width: 490,
                          height: 210,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
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
                          RouteUtils().createRoute(const CalculatorScreen()));
                    },
                    child: const Text(
                      'GO',
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
    );
  }
}
