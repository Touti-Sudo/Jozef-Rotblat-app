import 'package:englishproject/Ai_provider/ai_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:englishproject/theme/proviertheme.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    final currentBio = context.read<BioProvider>().bio;
    _controller = TextEditingController(
      text: currentBio.isNotEmpty
          ? currentBio
          : "You are Joseph Rotblat, winner of the Nobel Peace Prize. Always answer in first person, like you are Joseph Rotblat himself. Speak clearly, in an inspiring tone. Let the user ask about your life or work before giving details, never give details about your life unless if the user asks to. Stay strictly in character.",
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<Themeprovider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 5),
              child: Icon(
                Icons.settings,
                color: Color.fromARGB(255, 221, 220, 129),
              ),
            ),
            Text("Settings Page"),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: themeProvider.backgroundGradient,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ConstrainedBox(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 60, left: 30),
                          child: Text(
                            "General",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Theme"),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: FlutterSwitch(
                              width: 70,
                              height: 36,
                              toggleSize: 32,
                              borderRadius: 30,
                              padding: 3,

                              value: themeProvider.isDark,

                              activeColor: Colors.black,
                              inactiveColor: Color.fromARGB(255, 219, 205, 0),

                              activeIcon: const Icon(
                                Icons.nightlight_round,
                                color: Colors.black,
                                size: 18,
                              ),
                              inactiveIcon: const Icon(
                                Icons.wb_sunny,
                                color: Colors.orange,
                                size: 18,
                              ),

                              onToggle: (value) {
                                themeProvider.toggeletheme(value);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0,bottom: 30,left: 30),
                      child: Row(
                        children: [
                          Text("Ai settings",style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        right: 8,
                        bottom: 8,
                        
                      ),
                      child: SizedBox(
                        width: 500,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              controller: _controller,
                              maxLength: 400,
                              maxLines: null,
                              decoration: InputDecoration(
                                labelText: 'Ai_Prompts',
                                hintText: 'How do you want the Ai to act ? ',
                                hintStyle: TextStyle(),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Theme.of(
                                      context,
                                    ).scaffoldBackgroundColor,
                                  ),
                                ),

                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.surface,
                                    width: 2,
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                context.read<BioProvider>().setBio(
                                  value.trim(),
                                );
                                print("Updated Bio: $value");
                              },
                            ),
                            ValueListenableBuilder(
                              valueListenable: _controller,
                              builder: (context, TextEditingValue value, _) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    top: 4,
                                    left: 8,
                                  ),
                                  child: Text(
                                    '${value.text.length}/400 characters',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            top: 10,
                            right: 8.0,
                          ),
                          child: Container(
                            height: 110,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.redAccent.withAlpha(200),
                                  Colors.redAccent.withAlpha(2),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Wrap(
                                  children: [
                                    Text(
                                      "Important Note:",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text("The AI is trained for a specific purpose. Changing its behavior may cause instability, so please make minimal adjustments."),

                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
