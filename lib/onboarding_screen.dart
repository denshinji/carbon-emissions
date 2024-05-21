import 'package:carbon_emissions/introduction_screen.dart';
import 'package:carbon_emissions/theme/colors.dart';
import 'package:carbon_emissions/utils/route_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
          padding: const EdgeInsets.all(35),
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 161,
                height: 45,
              ),
              const Spacer(),
              Column(
                children: [
                  const Text(
                    'WELCOME TO',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 40,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    'CARCULATOR CARBON NETURAL',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 64,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(645, 85),
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
                      child: const Text(
                        'START',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
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
