import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';
import 'package:nad_gemini_ai_chat/features/config/env.dart';
import 'package:nad_gemini_ai_chat/features/model/message.dart';
import 'package:nad_gemini_ai_chat/features/view/gemini_messages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _msgEditingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  late FocusNode myFocusNode;

  @override
  void initState() {
    _msgEditingController;
    _scrollController;
    myFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    _msgEditingController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  // CUIDADO: 'gemini-pro' é um serviço pago.
  // CAUTION: 'gemini-pro' is a paid service.
  // https://ai.google.dev/pricing

  //final _generative_ai_model =
  //    GenerativeModel(model: 'gemini-pro', apiKey: Env.apiKey);

  final List<Message> _msg = [];

  bool scrollPermitido = false;

  void scrollListToEnd() async {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  Future<void> sendMessageToGeminiAI() async {
    var message = _msgEditingController.text;
    _msgEditingController.clear();

    setState(() {
      _msg.add(
        Message(
          isUser: true,
          message: message,
          date: DateTime.now(),
        ),
      );

      scrollListToEnd();
    });

    // CUIDADO: 'gemini-pro' é um serviço pago.
    // CAUTION: 'gemini-pro' is a paid service.
    // https://ai.google.dev/pricing
    // Se pretende mesmo usar, descomente o código desativado e desative os próximos Response e SetState.
    // If you really want to use it, uncomment the disabled code and comment the next Response and SetState.

    //var content = [Content.text(message)];
    /* var response = await _generative_ai_model.generateContent(content);
    setState(() {
      _msg.add(
        Message(
          isUser: false,
          message: response.text ?? "",
          date: DateTime.now(),
        ),
      );

      scrollListToEnd();
    }); */

    var response = message;
    setState(() {
      _msg.add(
        Message(
          isUser: false,
          message: response,
          date: DateTime.now(),
        ),
      );
    });

    scrollListToEnd();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 249, 233),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 194, 192, 147),
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: PopScope(
            child: Column(
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
                Expanded(
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      controller: _scrollController,
                      itemCount: _msg.length,
                      //reverse: true,
                      itemBuilder: (context, index) {
                        final msg = _msg[index];
                        if (index == _msg.length) {
                          return Container(
                            height: 140,
                          );
                        } else {
                          return GeminiMessages(
                            isUser: msg.isUser,
                            message: msg.message,
                            date: DateFormat('dd/MM/yyyy - HH:mm')
                                .format(msg.date),
                          );
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  child: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 15),
                      child: SizedBox(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 100,
                                  child: TextFormField(
                                    focusNode: myFocusNode,
                                    maxLines: null,
                                    controller: _msgEditingController,
                                    decoration: InputDecoration(
                                      floatingLabelStyle: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 194, 192, 147)),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 194, 192, 147),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 194, 192, 147),
                                        ),
                                      ),
                                      label: const Text(
                                        "Digite uma pergunta ou comando",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 194, 192, 147)),
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
                                        const Color.fromARGB(
                                            255, 194, 192, 147)),
                                    foregroundColor: MaterialStateProperty.all(
                                        const Color.fromARGB(
                                            255, 245, 249, 233)),
                                    shape: MaterialStateProperty.all(
                                      const CircleBorder(),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_msgEditingController.text.isNotEmpty) {
                                      sendMessageToGeminiAI();
                                      scrollListToEnd();
                                      // myFocusNode.requestFocus();
                                    } else {
                                      myFocusNode.requestFocus();
                                    }
                                  },
                                  icon: const Icon(Icons.arrow_upward_sharp),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
