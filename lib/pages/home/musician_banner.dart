import 'package:flutter/material.dart';

import '../../widgets/horizontal_scrollable.dart';
import 'musician_card.dart';

class MusicianBanner extends StatelessWidget {
  const MusicianBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        HorizontalScrollable(
          children: <Widget>[
            MusicianCard(
              name: 'Elysia',
              photo:
                  "https://onedrive.cypresses.online/api/raw/?path=/%E3%80%8C%E7%9C%9F%E6%88%91%E3%80%8D%E7%9A%84%E8%8B%B1%E6%A1%80%20%E7%88%B1%E8%8E%89%E5%B8%8C%E9%9B%85/Elysia.jpg",
            ),
            MusicianCard(
              name: 'Elysia',
              photo:
                  "https://onedrive.cypresses.online/api/raw/?path=/%E3%80%8C%E7%9C%9F%E6%88%91%E3%80%8D%E7%9A%84%E8%8B%B1%E6%A1%80%20%E7%88%B1%E8%8E%89%E5%B8%8C%E9%9B%85/Elysia.jpg",
            ),
            MusicianCard(
              name: 'Elysia',
              photo:
                  "https://onedrive.cypresses.online/api/raw/?path=/%E3%80%8C%E7%9C%9F%E6%88%91%E3%80%8D%E7%9A%84%E8%8B%B1%E6%A1%80%20%E7%88%B1%E8%8E%89%E5%B8%8C%E9%9B%85/Elysia.jpg",
            ),
            MusicianCard(
              name: 'Elysia',
              photo:
                  "https://onedrive.cypresses.online/api/raw/?path=/%E3%80%8C%E7%9C%9F%E6%88%91%E3%80%8D%E7%9A%84%E8%8B%B1%E6%A1%80%20%E7%88%B1%E8%8E%89%E5%B8%8C%E9%9B%85/Elysia.jpg",
            ),
          ],
        )
      ],
    );
  }
}
