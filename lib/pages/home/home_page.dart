import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forest_music_app/model/user.dart';
import 'package:forest_music_app/pages/home/header.dart';
import 'package:forest_music_app/theme.dart';
import 'package:forest_music_app/widgets/header_section.dart';
import 'package:forest_music_app/widgets/square_card.dart';

import '../../widgets/TabItem.dart';
import '../../widgets/horizontal_scrollable.dart';
import '../../widgets/vertical_music_card.dart';
import 'musicion_banner.dart';

class HomePage extends StatelessWidget {
  final User user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(
            left: 64,
            right: 64,
            top: 10,
          ),
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              TabItem(
                title: '首页',
                icon: Icon(FontAwesomeIcons.house, color: Color(0xDA605F5F)),
                active: true,
                activeIcon: Icon(
                  FontAwesomeIcons.house,
                  color: primary,
                ),
              ),
              TabItem(
                title: '搜索',
                icon: Icon(FontAwesomeIcons.magnifyingGlass,
                    color: Color(0xDA605F5F)),
                active: false,
                activeIcon: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: primary,
                ),
              ),
              TabItem(
                title: '音乐库',
                icon: Icon(FontAwesomeIcons.folder, color: Color(0xDA605F5F)),
                active: false,
                activeIcon: Icon(
                  FontAwesomeIcons.solidFolderClosed,
                  color: primary,
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: <Widget>[
              Header(user: user),
              const SizedBox(height: 20),
              const MusicianBanner(
                title: '热门艺人',
              ),
              const SizedBox(
                height: 40,
              ),
              const HeaderSection(title: "最近播放"),
              const SizedBox(
                height: 10,
              ),
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
              const HorizontalScrollable(
                children: <Widget>[
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
                ],
              ),
              const HeaderSection(title: "推荐专辑"),
              const HorizontalScrollable(
                children: <Widget>[
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
                ],
              )
            ],
          ),
        ));
  }
}
