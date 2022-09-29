import 'package:flutter/material.dart';
import 'package:forest_music_app/pages/login/login_page.dart';
import 'package:forest_music_app/pages/playlist/detail_page.dart';
import 'package:forest_music_app/theme.dart';
import 'package:just_audio_background/just_audio_background.dart';

Future<void> main() async {
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
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
      initialRoute: '/Login',
      routes: {
        '/Login': (context) => const LoginPage(),
        '/playlist/detail': (context) => const PlayListDetail()
      },
    );
  }
}
