import 'package:englishproject/theme/proviertheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BiographyPage extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String biography;
  final List<String> achievements;

  const BiographyPage({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.biography,
    required this.achievements,
  });

  @override
  Widget build(BuildContext context) {
        final themeProvider = Provider.of<Themeprovider>(context);
    return Scaffold(
appBar: AppBar(title: const Text("Biography"),backgroundColor: Theme.of(context).colorScheme.background,),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors:themeProvider.backgroundGradient,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  imageUrl,
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                biography,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 20),
              const Text(
                "Key Achievements",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 10),
              ...achievements.map((a) => ListTile(
                    leading: const Icon(Icons.star, color: Colors.amber),
                    title: Text(a),
                  )),
              const SizedBox(height: 30),
              const Divider(thickness: 1),
              const SizedBox(height: 10),
              const Text(
                '"Peace is not merely a distant goal that we seek, but a means by which we arrive at that goal." – Martin Luther King Jr.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
