import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forest_music_app/pages/home/home_page.dart';
import 'package:forest_music_app/pages/login/login_page.dart';
import 'package:forest_music_app/pages/playlist/detail_page.dart';
import 'package:forest_music_app/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Future<dynamic> future = Future(() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('isLogin', 0);
    return prefs.getInt('isLogin');
  });

  future.then((value) {
    if (value == 1) {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

      runApp(const ForestMusic(
        initPage: '/',
      ));
    } else {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

      runApp(const ForestMusic(
        initPage: '/Login',
      ));
    }
  }).catchError((_) {
    if (kDebugMode) {
      print('error');
    }
  });
}

class ForestMusic extends StatelessWidget {
  const ForestMusic({Key? key, required this.initPage}) : super(key: key);
  final String initPage;
  static final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '森之乐',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: ThemeData(useMaterial3: false, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: false, colorScheme: darkColorScheme),
        initialRoute: initPage,
        routes: {
          '/': (context) => HomePage(player: player),
          '/Login': (context) => LoginPage(player: player),
          '/playlist/detail': (context) => PlayListDetail(player: player)
        });
  }
}
