import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'category_card.dart';

class CategoryBanner extends StatelessWidget {
  const CategoryBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 10, bottom: 7),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          CategoryCard(
            title: '嘻哈',
            description: '1.4万播放量',
            image: 'assets/images/hihop.png',
            onPress: () {
              if (kDebugMode) {
                print('111');
              }
            },
          ),
          CategoryCard(
            title: '嘻哈',
            description: '1.4万播放量',
            image: 'assets/images/hihop.png',
            onPress: () {
              if (kDebugMode) {
                print('111');
              }
            },
          ),
          CategoryCard(
            title: '嘻哈',
            description: '1.4万播放量',
            image: 'assets/images/hihop.png',
            onPress: () {
              if (kDebugMode) {
                print('111');
              }
            },
          )
        ],
      ),
    );
  }
}
