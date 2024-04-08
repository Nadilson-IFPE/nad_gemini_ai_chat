import 'package:flutter/material.dart';
import 'package:nad_gemini_ai_chat/features/view/home_page.dart';
import 'package:nad_gemini_ai_chat/utils/screen_mode.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    ScreenMode.enterFullScreenMode();
    Future.delayed(const Duration(seconds: 2)).then((_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(
            title: 'Google Gemini AI Chat App',
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    ScreenMode.exitFullScreenMode();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: Image.asset(
          "assets/google_gemini_ai_chat_app_splash_screen.png",
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }
}
