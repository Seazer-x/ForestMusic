import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import './header.dart';
import '../../widgets/header_section.dart';
import '../../widgets/horizontal_scrollable.dart';
import '../../widgets/square_card.dart';
import '../../widgets/vertical_music_card.dart';
import 'musician_banner.dart';

class IndexPage extends StatefulWidget {
  final AudioPlayer player;
  const IndexPage({Key? key, required this.player}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const ClampingScrollPhysics(),
        child: Column(children: <Widget>[
          Header(player: widget.player),
          const HeaderSection(title: "热门艺人"),
          const MusicianBanner(),
          const HeaderSection(title: "最近播放"),
          const HorizontalScrollable(
            children: [
              VerticalMusicCard(
                name: 'Moon Halo',
                cover:
                    'https://onedrive.cypresses.online/api/raw/?path=/%E3%80%8C%E7%9C%9F%E6%88%91%E3%80%8D%E7%9A%84%E8%8B%B1%E6%A1%80%20%E7%88%B1%E8%8E%89%E5%B8%8C%E9%9B%85/Elysia4.jpg',
                album: 'HOYO Mix',
                artist: 'dv',
              ),
              VerticalMusicCard(
                name: 'Moon Halo',
                cover:
                    'https://onedrive.cypresses.online/api/raw/?path=/%E3%80%8C%E7%9C%9F%E6%88%91%E3%80%8D%E7%9A%84%E8%8B%B1%E6%A1%80%20%E7%88%B1%E8%8E%89%E5%B8%8C%E9%9B%85/Elysia4.jpg',
                album: 'HOYO Mix',
                artist: 'dv',
              ),
              VerticalMusicCard(
                name: 'Moon Halo',
                cover:
                    'https://onedrive.cypresses.online/api/raw/?path=/%E3%80%8C%E7%9C%9F%E6%88%91%E3%80%8D%E7%9A%84%E8%8B%B1%E6%A1%80%20%E7%88%B1%E8%8E%89%E5%B8%8C%E9%9B%85/Elysia4.jpg',
                album: 'HOYO Mix',
                artist: 'dv',
              ),
              VerticalMusicCard(
                name: 'Moon Halo',
                cover:
                    'https://onedrive.cypresses.online/api/raw/?path=/%E3%80%8C%E7%9C%9F%E6%88%91%E3%80%8D%E7%9A%84%E8%8B%B1%E6%A1%80%20%E7%88%B1%E8%8E%89%E5%B8%8C%E9%9B%85/Elysia4.jpg',
                album: 'HOYO Mix',
                artist: 'dv',
              ),
              VerticalMusicCard(
                name: 'Moon Halo',
                cover:
                    'https://onedrive.cypresses.online/api/raw/?path=/%E3%80%8C%E7%9C%9F%E6%88%91%E3%80%8D%E7%9A%84%E8%8B%B1%E6%A1%80%20%E7%88%B1%E8%8E%89%E5%B8%8C%E9%9B%85/Elysia4.jpg',
                album: 'HOYO Mix',
                artist: 'dv',
              ),
            ],
          ),
          const HeaderSection(title: "推荐歌单"),
          const HorizontalScrollable(children: <Widget>[
            SquareCard(
              photo:
                  'https://onedrive.cypresses.online/api/raw/?path=/%E3%80%8C%E7%9C%9F%E6%88%91%E3%80%8D%E7%9A%84%E8%8B%B1%E6%A1%80%20%E7%88%B1%E8%8E%89%E5%B8%8C%E9%9B%85/Elysia4.jpg',
              title: '心流歌单',
              description: '歌单描述',
            ),
            SquareCard(
              photo:
                  'https://onedrive.cypresses.online/api/raw/?path=/%E3%80%8C%E7%9C%9F%E6%88%91%E3%80%8D%E7%9A%84%E8%8B%B1%E6%A1%80%20%E7%88%B1%E8%8E%89%E5%B8%8C%E9%9B%85/Elysia4.jpg',
              title: '心流歌单',
              description: '歌单描述',
            ),
            SquareCard(
              photo:
                  'https://onedrive.cypresses.online/api/raw/?path=/%E3%80%8C%E7%9C%9F%E6%88%91%E3%80%8D%E7%9A%84%E8%8B%B1%E6%A1%80%20%E7%88%B1%E8%8E%89%E5%B8%8C%E9%9B%85/Elysia4.jpg',
              title: '心流歌单',
              description: '歌单描述',
            ),
            SquareCard(
              photo:
                  'https://onedrive.cypresses.online/api/raw/?path=/%E3%80%8C%E7%9C%9F%E6%88%91%E3%80%8D%E7%9A%84%E8%8B%B1%E6%A1%80%20%E7%88%B1%E8%8E%89%E5%B8%8C%E9%9B%85/Elysia4.jpg',
              title: '心流歌单',
              description: '歌单描述',
            ),
          ]),
          const HeaderSection(title: "推荐专辑"),
          const HorizontalScrollable(children: <Widget>[
            SquareCard(
              photo:
                  'https://onedrive.cypresses.online/api/raw/?path=/%E3%80%8C%E7%9C%9F%E6%88%91%E3%80%8D%E7%9A%84%E8%8B%B1%E6%A1%80%20%E7%88%B1%E8%8E%89%E5%B8%8C%E9%9B%85/Elysia4.jpg',
              title: '心流歌单',
              description: '歌单描述',
            ),
            SquareCard(
              photo:
                  'https://onedrive.cypresses.online/api/raw/?path=/%E3%80%8C%E7%9C%9F%E6%88%91%E3%80%8D%E7%9A%84%E8%8B%B1%E6%A1%80%20%E7%88%B1%E8%8E%89%E5%B8%8C%E9%9B%85/Elysia4.jpg',
              title: '心流歌单',
              description: '歌单描述',
            ),
            SquareCard(
              photo:
                  'https://onedrive.cypresses.online/api/raw/?path=/%E3%80%8C%E7%9C%9F%E6%88%91%E3%80%8D%E7%9A%84%E8%8B%B1%E6%A1%80%20%E7%88%B1%E8%8E%89%E5%B8%8C%E9%9B%85/Elysia4.jpg',
              title: '心流歌单',
              description: '歌单描述',
            ),
            SquareCard(
              photo:
                  'https://onedrive.cypresses.online/api/raw/?path=/%E3%80%8C%E7%9C%9F%E6%88%91%E3%80%8D%E7%9A%84%E8%8B%B1%E6%A1%80%20%E7%88%B1%E8%8E%89%E5%B8%8C%E9%9B%85/Elysia4.jpg',
              title: '心流歌单',
              description: '歌单描述',
            )
          ])
        ]));
  }
}
