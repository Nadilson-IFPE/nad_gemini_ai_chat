import 'package:flutter/material.dart';
import 'package:nad_gemini_ai_chat/features/view/home_page.dart';
import 'package:nad_gemini_ai_chat/features/view/splash_screen.dart';
import 'package:nad_gemini_ai_chat/utils/devices.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Google Gemini AI Chat App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Devices.isMobilePhone(context)
          ? const SplashScreen()
          : const HomePage(title: 'Google Gemini AI Chat App'),
    );
  }
}
