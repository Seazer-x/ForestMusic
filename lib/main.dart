import 'package:flutter/material.dart';
import 'package:forest_music_app/pages/home/home_page.dart';
import 'package:forest_music_app/pages/login/login_page.dart';
import 'package:forest_music_app/theme.dart';

void main() {
  runApp(const ForestMusic());
}

class ForestMusic extends StatelessWidget {
  const ForestMusic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '森之乐',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/Login': (context) => const LoginPage()
      },
    );
  }
}
