import 'package:englishproject/components/video_card.dart';
import 'package:englishproject/theme/proviertheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VideosPage extends StatefulWidget {
  final List<String> videos;

  const VideosPage({Key? key, required this.videos}) : super(key: key);

  @override
  State<VideosPage> createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
        final themeProvider = Provider.of<Themeprovider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Text('Videos related to peace'),
        ),
        backgroundColor:Theme.of(context).colorScheme.background,

      ),

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors:themeProvider.backgroundGradient,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: ListView.builder(
            itemCount: widget.videos.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: VideoCard(url: widget.videos[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}
