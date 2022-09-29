import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:forest_music_app/pages/playlist/detail_page.dart';

import 'category_card.dart';

class CategoryBanner extends StatelessWidget {
  const CategoryBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 20, bottom: 7),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          CategoryCard(
            title: '嘻哈',
            description: '1.4万播放量',
            image: 'assets/images/hip-hop.png',
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PlayListDetail()),
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
        ],
      ),
    );
  }
}
