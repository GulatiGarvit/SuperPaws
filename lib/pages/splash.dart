import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:super_paws/pages/dashboard.dart';
import 'package:super_paws/pages/onboarding.dart';
import 'package:super_paws/utils/loading_dialog.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    doTheDeed();
  }

  void doTheDeed() async {
    await Future.delayed(const Duration(milliseconds: 100));
    LoadingDialog(context).showLoader(false);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => FirebaseAuth.instance.currentUser != null
            ? Dashboard()
            : OnboardingPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
    );
  }
}
