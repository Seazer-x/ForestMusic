import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:forest_music_app/pages/home/notification.dart';

import 'category_banner.dart';

class Header extends StatelessWidget {
  final AudioPlayer player;
  const Header({
    Key? key,
    required this.player,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 290,
      child: Stack(
        children: <Widget>[
          const NotificationArea(),
          Column(children: <Widget>[
            const SizedBox(height: 130),
            CategoryBanner(player: player)
          ])
        ],
      ),
    );
  }
}
