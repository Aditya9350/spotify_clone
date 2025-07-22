import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/Login_Screen/select_artist_screen.dart';
import 'package:untitled1/constants/color_files/app_colors.dart';
import 'package:untitled1/screens/dashboard_screen.dart';
import 'package:untitled1/screens/home_screen.dart';
import 'package:untitled1/screens/spotify_login_screen.dart';
import 'package:untitled1/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await _initializeFirebase();
  runApp(const MyApp());
}

Future<void> _initializeFirebase() async {
  if (Platform.isAndroid) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: 'AIzaSyBL9EN1ic8rYQREcdowJryXNJbWsiQlEZE',
            appId: '1:1098732323994:android:b93c4c660813077c948b23',
            messagingSenderId: '1098732323994',
            projectId: 'calling-app-bdd36'));
  } else {
    await Firebase.initializeApp();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        splashColor: AppColors.transparent,
        highlightColor: AppColors.transparent
      ),
      home:  DashboardScreen(),
    );
  }
}

