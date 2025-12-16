import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:englishproject/pages/biography_page.dart';
import 'package:englishproject/pages/home_page_content.dart';
import 'package:englishproject/pages/quiz_page.dart';
import 'package:englishproject/pages/settings_page.dart';
import 'package:englishproject/pages/videos_page.dart';
import 'package:englishproject/theme/proviertheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedNavIndex = 0;

  final List<Widget> items = const [
    Icon(Icons.home, color: Colors.white),
    Icon(Icons.video_collection, color: Colors.white),
    Icon(Icons.person, color: Colors.white),
    Icon(Icons.quiz, color: Colors.white),
    Icon(Icons.settings, color: Colors.white),
  ];
  @override
  Widget build(BuildContext context) {
        final themeProvider = Provider.of<Themeprovider>(context);
    final List<String> videos=["https://www.youtube.com/watch?v=1CqGeAmVu1I","https://www.youtube.com/shorts/frfy8zj1xA0","https://www.youtube.com/watch?v=-FF9Gh-mdAk","https://www.youtube.com/watch?v=5bO9ks3bBJI","https://www.youtube.com/watch?v=vR47knFt7rs","https://www.youtube.com/watch?v=3fQ17Mbbtk8"];
  final List<Widget> pages = [
    const HomePageContent(),
    VideosPage(videos: videos),
    const BiographyPage(name: "",  achievements: [
    "💡 Resigned from the Manhattan Project after realizing its destructive purpose — the only scientist to do so.",
    "🕊️ Dedicated his life to nuclear disarmament and the peaceful use of science.",
    "🌍 Co-founded the Pugwash Conferences on Science and World Affairs in 1957.",
    "🏅 Received the Nobel Peace Prize (1995) jointly with the Pugwash Conferences for their work toward global disarmament.",
    "📚 Advocated for ethical responsibility in science, encouraging scientists to consider the moral consequences of their work.",
    "🧭 Authored numerous works on peace, science ethics, and the dangers of nuclear weapons.",
    "🎓 Served as a professor and mentor, influencing generations of scientists and students.",
    "🗣️ Promoted dialogue between East and West during the Cold War, encouraging peaceful coexistence.",
    "🕯️ Symbol of moral integrity in science, showing that ethics can guide even in times of war.",
  ],biography:"Joseph Rotblat (1908–2005) was a Polish-born physicist, humanitarian, and one of the most influential voices for nuclear disarmament in the 20th century.He was born in Warsaw, Poland, where he developed an early fascination for science despite growing up in poverty. Rotblat studied electrical engineering before turning to physics, earning his Ph.D. in nuclear physics at the University of Warsaw.In the late 1930s, his career took a dramatic turn when he joined the British team of scientists working on atomic research during World War II. He later became part of the Manhattan Project, the U.S. program that aimed to build the first atomic bomb. However, Rotblat’s moral convictions set him apart from most of his peers — when he realized that Nazi Germany was no longer pursuing a nuclear weapon, he decided to resign from the project, becoming the only scientist to leave the Manhattan Project on moral grounds.After the war, he devoted his life to the ethical use of science. Deeply troubled by the destruction of Hiroshima and Nagasaki, Rotblat became an outspoken advocate for global peace and the elimination of nuclear weapons. He co-founded the Pugwash Conferences on Science and World Affairs in 1957, a movement bringing together scientists and public figures to discuss ways to reduce the threat of armed conflict and promote responsible scientific conduct.Throughout his life, Rotblat worked tirelessly to ensure that science would serve humanity rather than destroy it. He often said that “scientists have the moral duty to ensure their discoveries benefit mankind, not harm it.In 1995, he and the Pugwash Conferences jointly received the Nobel Peace Prize, honoring their efforts to diminish the role of nuclear arms in international politics and to promote ethical responsibility in science.Until his death in 2005, Joseph Rotblat continued writing, lecturing, and inspiring future generations to unite scientific progress with compassion, conscience, and peace. His legacy lives on as a symbol of integrity, courage, and the belief that one individual’s conscience can truly change the world." ,imageUrl: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQy86TH1-Z2WwjbS2CujkAwP0RlMofBKa6_5uJtktWMDiK9CN-uRErsarlST0H0Gy-s_60kAnBuxQx-AIvX6gb8I2hdOVkfmZXLpY65XSR5",),
    const QuizPage(),
    const SettingsPage(),
  ];
    return Scaffold(

      body: Container(
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors:themeProvider.backgroundGradient,
          ),
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.1, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            );
          },
          child: pages[selectedNavIndex],
        ),
      ),

      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent, 
        color: Colors.lightBlue,
        buttonBackgroundColor: const Color(0xFFD4AF37),
        items: items,
        index: selectedNavIndex,
        height: 60,
        onTap: (index) {
          setState(() {
            selectedNavIndex = index;
          });
        },
      ),
    );
  }
}
