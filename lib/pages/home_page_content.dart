import 'package:englishproject/pages/ai_page.dart';
import 'package:englishproject/pages/quiz_page.dart';
import 'package:englishproject/theme/proviertheme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<Themeprovider>(context);
    final facts = [
      "Joseph Rotblat left the Manhattan Project when he realized its destructive purpose.",
      "He co-founded the Pugwash Conferences to promote nuclear disarmament.",
      "He won the Nobel Peace Prize in 1995.",
    ];
    String greeting() {
      final hour = DateTime.now().hour;
      if (hour < 12) return "Good Morning,";
      if (hour < 18) return "Good Afternoon,";
      return "Good Evening,";
    }

    final randomFact = (facts..shuffle()).first;
    final today = DateFormat('EEEE, MMMM d, yyyy').format(DateTime.now());
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: themeProvider.backgroundGradient,
            ),
          ),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today, size: 25),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            today.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: Row(
                      children: [
                        Text(
                          greeting(),
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontWeight: FontWeight.bold,
                            fontSize: 27,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: Row(
                      children: [
                        Text(
                          "Students",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontWeight: FontWeight.bold,
                            fontSize: 27,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: SearchBar(
                        backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).scaffoldBackgroundColor,
                        ),
                        hintText: "Hey, wanna ask something about me ?",
                        onSubmitted: (value) {
                          if (value.trim().isEmpty) return;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ToutiGptPage(initialMessage: value),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color:        Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/rotblat.jpg',
                                width: 90,
                                height: 90,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Joseph Rotblat",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,

                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "\"The most important step is to change the way people think.\"",
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.lightbulb_outline,
                            color: Colors.amber,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              randomFact,
                              style: const TextStyle(
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 220,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 0.85,
                        aspectRatio: 16 / 9,
                        autoPlayInterval: const Duration(seconds: 4),
                      ),
                      items:
                          [
                            {
                              'image': 'assets/rotblat1.jpg',
                              'caption':
                                  'Rotblat working on early nuclear research (1940s)',
                            },
                            {
                              'image': 'assets/rotblat2.jpg',
                              'caption':
                                  'Leaving the Manhattan Project for moral reasons (1944)',
                            },
                            {
                              'image': 'assets/rotblat3.jpg',
                              'caption':
                                  'Co-founding the Pugwash Conferences on Science and World Affairs (1957)',
                            },
                            {
                              'image': 'assets/rotblat4.jpg',
                              'caption':
                                  'Receiving the Nobel Peace Prize (1995)',
                            },
                          ].map((item) {
                            return Builder(
                              builder: (context) {
                                return Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset(
                                        item['image']!,
                                        width: double.infinity,
                                        height: 160,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      item['caption']!,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          }).toList(),
                    ),
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black87,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QuizPage()),
                      );
                    },

                    child: const Text("Test Your Knowledge 🧠"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
