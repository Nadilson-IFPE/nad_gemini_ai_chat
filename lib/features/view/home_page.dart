import 'package:flutter/material.dart';
import 'package:nad_gemini_ai_chat/features/config/env.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "GOOGLE_GEMINI_AI_API_KEY: ${Env.apiKey}",
            ),
          ),
        ],
      ),
    );
  }
}
