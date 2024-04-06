import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:nad_gemini_ai_chat/features/config/env.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _msgEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 249, 233),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 194, 192, 147),
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        // Apenas para fins de testes do arquivo ".env"
        // For testing purposes of the ".env" file only
        //children: [
        //  Center(
        //child: Text(
        //  "GOOGLE_GEMINI_AI_API_KEY: ${Env.apiKey}",
        //),
        //      ),
        //],
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
            child: Row(
              children: [
                Expanded(
                  flex: 40,
                  child: TextFormField(
                    maxLines: null,
                    controller: _msgEditingController,
                    decoration: InputDecoration(
                      floatingLabelStyle: const TextStyle(
                          color: Color.fromARGB(255, 194, 192, 147)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 194, 192, 147),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 194, 192, 147),
                        ),
                      ),
                      label: const Text(
                        "Digite uma pergunta ou comando",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 194, 192, 147)),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                IconButton(
                  padding: const EdgeInsets.all(15),
                  iconSize: 32,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 194, 192, 147)),
                    foregroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 245, 249, 233)),
                    shape: MaterialStateProperty.all(
                      const CircleBorder(),
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_upward_sharp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
