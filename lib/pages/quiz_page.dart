import 'package:englishproject/theme/proviertheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestion = 0;
  int score = 0;
  final questions = [
{
  'question': 'When was Joseph Rotblat born?',
  'answers': [
    {'text': '1918', 'correct': false},
    {'text': '1908', 'correct': true},
    {'text': '1928', 'correct': false},
  ],
},
{
  'question': 'Where was Joseph Rotblat born?',
  'answers': [
    {'text': 'Paris, France', 'correct': false},
    {'text': 'London, United Kingdom', 'correct': false},
    {'text': 'Warsaw, Poland', 'correct': true},
  ],
},
{
  'question': 'Why did Joseph Rotblat leave the Manhattan Project?',
  'answers': [
    {'text': 'He disagreed with its military purpose', 'correct': true},
    {'text': 'He was fired for leaking information', 'correct': false},
    {'text': 'He moved to another project in Europe', 'correct': false},
  ],
},
{
  'question': 'What organization did Rotblat co-found?',
  'answers': [
    {'text': 'The Pugwash Conferences on Science and World Affairs', 'correct': true},
    {'text': 'Greenpeace', 'correct': false},
    {'text': 'The United Nations', 'correct': false},
  ],
},
{
  'question': 'In what year did Joseph Rotblat win the Nobel Peace Prize?',
  'answers': [
    {'text': '1955', 'correct': false},
    {'text': '1995', 'correct': true},
    {'text': '2005', 'correct': false},
  ],
},
{
  'question': 'What was Joseph Rotblat’s main message?',
  'answers': [
    {'text': 'Science should serve humanity, not war', 'correct': true},
    {'text': 'Nuclear weapons are necessary for peace', 'correct': false},
    {'text': 'Technology should be banned', 'correct': false},
  ],
},
{
  'question': 'Which major document did he help create in 1955?',
  'answers': [
    {'text': 'The Russell–Einstein Manifesto', 'correct': true},
    {'text': 'The Geneva Convention', 'correct': false},
    {'text': 'The Non-Proliferation Treaty', 'correct': false},
  ],
},
{
  'question': 'What was Rotblat’s profession?',
  'answers': [
    {'text': 'Physicist', 'correct': true},
    {'text': 'Chemist', 'correct': false},
    {'text': 'Biologist', 'correct': false},
  ],
},
{
  'question': 'Where did Rotblat teach after World War II?',
  'answers': [
    {'text': 'University of London', 'correct': true},
    {'text': 'Oxford University', 'correct': false},
    {'text': 'MIT', 'correct': false},
  ],
},
{
  'question': 'When did Joseph Rotblat pass away?',
  'answers': [
    {'text': '1999', 'correct': false},
    {'text': '2005', 'correct': true},
    {'text': '2010', 'correct': false},
  ],
},
  ];

  void checkAnswer(bool isCorrect) {
    if (isCorrect) score++;
    if (currentQuestion < questions.length - 1) {
      setState(() => currentQuestion++);
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Quiz Completed!'),
          content: Text('Your score: $score / ${questions.length}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
        final themeProvider = Provider.of<Themeprovider>(context);
    final q = questions[currentQuestion];
    return Scaffold(
      appBar: AppBar(title: const Text("Knowledge Quiz"),backgroundColor: Theme.of(context).colorScheme.background,),
     body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
          colors:themeProvider.backgroundGradient,
            ),
          ),
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              q['question'] as String,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ...(q['answers'] as List<Map<String, Object>>).map((a) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ElevatedButton(
                  onPressed: () => checkAnswer(a['correct'] as bool),
                  child: Text(a['text'] as String),
                ),
              );
            }),
          ],
        ),
      ),
    ));
  }
}
