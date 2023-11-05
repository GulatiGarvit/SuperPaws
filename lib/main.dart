import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:super_paws/firebase_options.dart';
import 'package:super_paws/pages/onboarding.dart';
import 'package:super_paws/pages/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Super Pets',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
