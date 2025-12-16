import 'package:englishproject/Ai_provider/ai_provider.dart';
import 'package:englishproject/pages/home_page.dart';
import 'package:englishproject/settings/settings_provider.dart';
import 'package:englishproject/theme/proviertheme.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('settings');
  await Hive.openBox('theme');
ChangeNotifierProvider(
  create: (_) => BioProvider(),
);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Themeprovider()),
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
        ChangeNotifierProvider(create: (_) => BioProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: Provider.of<Themeprovider>(context).themeData,
    );
  }
}
