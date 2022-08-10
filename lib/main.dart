import 'package:flutter/material.dart';
import 'package:love_sing_app/pages/Home.dart';
import 'package:love_sing_app/pages/Login.dart';
import 'package:love_sing_app/theme.dart';

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
        '/': (context) => const Home(),
        '/Login': (context) => const Login()
      },
    );
  }
}
