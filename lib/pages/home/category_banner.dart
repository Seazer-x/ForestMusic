import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:forest_music_app/pages/playlist/detail_page.dart';

import 'category_card.dart';

class CategoryBanner extends StatelessWidget {
  final AudioPlayer player;
  const CategoryBanner({Key? key, required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, bottom: 10),
        scrollDirection: Axis.horizontal,
        child: Row(children: <Widget>[
          CategoryCard(
            title: '嘻哈',
            description: '1.4万播放量',
            image: 'assets/images/hip-hop.png',
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PlayListDetail(player: player)),
              );
            },
          ),
          CategoryCard(
            title: '流行',
            description: '5.1万播放量',
            image: 'assets/images/pop.png',
            onPress: () {
              Navigator.pushNamed(context, '/playlist/detail');
            },
          ),
          CategoryCard(
            title: '灵魂乐',
            description: '1万播放量',
            image: 'assets/images/soul.png',
            onPress: () {
              Navigator.pushNamed(context, '/playlist/detail');
            },
          )
        ]));
  }
}
