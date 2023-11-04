import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:super_paws/colors/dark_mode.dart';
import 'package:super_paws/colors/light_mode.dart';
import 'package:super_paws/styles/text_styles.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  bool isExpanded = false;
  bool isFirst = true;
  bool isSecond = false;
  bool isThird = false;
  bool isFourth = false;
  bool isPhone = true;
  String phone = "";
  String name = "";
  String verificationId = "";
  String otp = "";
  String? error;
  FirebaseAuth mAuth = FirebaseAuth.instance;

  final fadeDuration = const Duration(milliseconds: 200);
  final slideUpDuration = const Duration(milliseconds: 400);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: DarkModeColors.colorPrimary,
          appBar: AppBar(
            backgroundColor: DarkModeColors.colorPrimary,
            title: const Text(
              "Super Pets",
              style: textMediumPrimaryBold,
            ),
          ),
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2.25,
                  decoration: const BoxDecoration(
                    gradient: RadialGradient(colors: [
                      DarkModeColors.colorPrimaryLight,
                      DarkModeColors.colorPrimary,
                    ], center: Alignment.center),
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/images/dog_photoshop.png",
                      width: MediaQuery.of(context).size.width / 1.35,
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomSheet: AnimatedSize(
            duration: slideUpDuration,
            child: Container(
              width: double.infinity,
              height: isExpanded
                  ? MediaQuery.of(context).size.height - 26
                  : MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
              ),
              child: !isExpanded
                  ? AnimatedOpacity(
                      opacity: isFirst ? 1 : 0,
                      duration: fadeDuration,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Spacer(),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                    text: "Virtual",
                                    style: textLargePrimaryTheme),
                                TextSpan(
                                    text: " Pets for ",
                                    style: textLargePrimary),
                                TextSpan(
                                    text: "Real", style: textLargePrimaryTheme),
                                TextSpan(
                                    text: " Impact", style: textLargePrimary),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text(
                            "Embrace the Joy of Digital Pet Ownership",
                            style: textMediumPrimary,
                          ),
                          const Spacer(),
                          SimpleShadow(
                            color: LightModeColors.colorPrimary,
                            offset: Offset.zero,
                            sigma: 10,
                            child: ElevatedButton(
                              onPressed: () async {
                                await Future.delayed(
                                    const Duration(milliseconds: 100));
                                setState(() {
                                  isFirst = !isFirst;
                                });
                                await Future.delayed(
                                    const Duration(milliseconds: 200));
                                setState(() {
                                  isExpanded = !isExpanded;
                                });
                                await Future.delayed(
                                    const Duration(milliseconds: 100));
                                setState(() {
                                  isSecond = !isSecond;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 18, horizontal: 36),
                                  splashFactory: InkRipple.splashFactory,
                                  backgroundColor:
                                      LightModeColors.colorPrimary),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Get Started",
                                    style: textMediumLightBold,
                                  ),
                                  Icon(
                                    Icons.chevron_right_rounded,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ): Container(),
            ),
          ),
        ),
        onWillPop: () async {
          if (isFirst) {
            return true;
          } else if (isThird) {
            setState(() {
              isSecond = !isSecond;
            });
            await Future.delayed(
              const Duration(milliseconds: 100),
            );
            setState(() {
              isThird = !isThird;
            });
            return false;
          } else {
            setState(() {
              isSecond = !isSecond;
            });
            await Future.delayed(
              const Duration(milliseconds: 100),
            );
            setState(() {
              isExpanded = !isExpanded;
            });
            await Future.delayed(const Duration(milliseconds: 100));
            setState(() {
              isFirst = !isFirst;
            });
            return false;
          }
        });
  }
}
