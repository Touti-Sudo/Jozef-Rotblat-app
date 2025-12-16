import 'dart:convert';
import 'package:englishproject/Ai_provider/ai_provider.dart';
import 'package:englishproject/components/chat_box.dart';
import 'package:englishproject/theme/proviertheme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ToutiGptPage extends StatefulWidget {
  final String? initialMessage;
  const ToutiGptPage({super.key, this.initialMessage});

  @override
  State<ToutiGptPage> createState() => _ToutiGptPageState();
}

class _ToutiGptPageState extends State<ToutiGptPage> {
  final TextEditingController textController = TextEditingController();
  final List<Map<String, dynamic>> messages = [];
  bool isTyping = false;

  Future<void> _displayTypewriterText(String text) async {
  String currentText = '';
  bool firstCharAdded = false;

  for (int i = 0; i < text.runes.length; i++) {
    await Future.delayed(const Duration(milliseconds: 30));
    setState(() {
      currentText = String.fromCharCodes(text.runes.take(i + 1));
      if (messages.isNotEmpty && messages.last['isUser'] == false) {
        messages.last['text'] = currentText;
      } else {
        messages.add({'text': currentText, 'isUser': false});
      }

      if (!firstCharAdded) {
        isTyping = false; 
        firstCharAdded = true;
      }
    });
  }
}

  Future<void> askToutiGPT(String userMessage) async {
    if (userMessage.trim().isEmpty) return;

    final bioProvider = Provider.of<BioProvider>(context, listen: false);
    final sessionBio = bioProvider.bio.trim().isEmpty
        ? "You are Joseph Rotblat, winner of the Nobel Peace Prize. Always answer in first person, like you are Joseph Rotblat himself. Speak clearly, in an inspiring tone. Let the user ask about your life or work before giving details, never give details about your life unless if the user asks to. Stay strictly in character."
        : bioProvider.bio.trim();

    setState(() {
      messages.add({'text': userMessage, 'isUser': true});
      isTyping = true;
      textController.clear();
    });

    final List<Map<String, String>> messageHistory = [
      {'role': 'system', 'content': sessionBio},
      ...messages.map((msg) => {
            'role': msg['isUser'] ? 'user' : 'assistant',
            'content': msg['text'],
          }),
    ];

    const apiKey = 'Your API key';
    const apiUrl = 'https://openrouter.ai/api/v1/chat/completions';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
        'X-Title': 'Joseph Rotblat',
      },
      body: jsonEncode({
        'model': 'mistralai/mistral-7b-instruct:free',
        'messages': messageHistory,
      }),
    );

    String reply;
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      reply = data['choices'][0]['message']['content'] ?? '';
    } else {
      reply = 'Something went wrong 😢';
    }

    await _displayTypewriterText(reply);

    setState(() {
      isTyping = false;
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.initialMessage != null && widget.initialMessage!.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        askToutiGPT(widget.initialMessage!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<Themeprovider>(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: themeProvider.backgroundGradient,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            "Joseph Rotblat",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: messages.length + (isTyping ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (isTyping && index == messages.length) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 16,
                        ),
                        child: TypingIndicator(),
                      );
                    }
                    final msg = messages[index];
                    return ChatBox(text: msg['text'], isUser: msg['isUser']);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: textController,
                  onSubmitted: (_) => askToutiGPT(textController.text),
                  decoration: InputDecoration(
                    hintText: "Ask something...",
                    filled: true,
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () => askToutiGPT(textController.text),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TypingIndicator extends StatefulWidget {
  const TypingIndicator({super.key});

  @override
  State<TypingIndicator> createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<TypingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _dotsAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..repeat();
    _dotsAnimation = StepTween(begin: 0, end: 3).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _dotsAnimation,
      builder: (context, child) {
        String dots = '.' * _dotsAnimation.value;
        return Text(
          "Joseph Rotblat is typing$dots",
          style: const TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 18,
            color: Colors.black,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

