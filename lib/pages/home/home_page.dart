import 'package:audioplayers/audioplayers.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forest_music_app/pages/home/header.dart';
import 'package:forest_music_app/theme.dart';
import 'package:forest_music_app/widgets/header_section.dart';
import 'package:forest_music_app/widgets/square_card.dart';

import '../../widgets/horizontal_scrollable.dart';
import '../../widgets/vertical_music_card.dart';
import 'index_page.dart';
import 'musician_banner.dart';

class HomePage extends StatefulWidget {
  final AudioPlayer player;
  const HomePage({Key? key, required this.player}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  void changePage(int? index) {
    setState(() {
      currentIndex = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                enableFeedback: false,
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.bars)),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.red.shade200,
            clipBehavior: Clip.hardEdge,
            child: const Icon(FontAwesomeIcons.solidHeart, color: Colors.red),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          bottomNavigationBar: BubbleBottomBar(
            currentIndex: currentIndex,
            onTap: changePage,
            opacity: .2,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            elevation: 10,
            fabLocation: BubbleBottomBarFabLocation.end, //new
            hasNotch: true, //new
            hasInk: true, //new, gives a cute ink effect
            inkColor:
                Colors.black12, //optional, uses theme color if not specified
            items: const <BubbleBottomBarItem>[
              BubbleBottomBarItem(
                  backgroundColor: primary,
                  icon: Icon(
                    FontAwesomeIcons.house,
                    color: Colors.black,
                  ),
                  activeIcon: Icon(
                    FontAwesomeIcons.house,
                    color: primary,
                  ),
                  title: Text("主页")),
              BubbleBottomBarItem(
                  backgroundColor: Colors.blue,
                  icon: Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: Colors.black,
                  ),
                  activeIcon: Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: Colors.blue,
                  ),
                  title: Text("搜索")),
              BubbleBottomBarItem(
                  backgroundColor: Colors.indigoAccent,
                  icon: Icon(
                    FontAwesomeIcons.meteor,
                    color: Colors.black,
                  ),
                  activeIcon: Icon(
                    FontAwesomeIcons.meteor,
                    color: Colors.indigoAccent,
                  ),
                  title: Text("探索"))
            ],
          ),
          body: currentIndex == 0
              ? IndexPage(player: widget.player)
              : currentIndex == 1
                  ? SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      physics: const ClampingScrollPhysics(),
                      child: Column(
                        children: const <Widget>[
                          SizedBox(height: 20),
                          HeaderSection(title: "热门艺人"),
                          MusicianBanner(),
                          SizedBox(
                            height: 40,
                          ),
                          HeaderSection(title: "最近播放"),
                          SizedBox(
                            height: 10,
                          ),
                          HorizontalScrollable(
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
                          HeaderSection(title: "推荐歌单"),
                          HorizontalScrollable(
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
                          HeaderSection(title: "推荐专辑"),
                          HorizontalScrollable(
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
                    )
                  : SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      physics: const ClampingScrollPhysics(),
                      child: Column(
                        children: <Widget>[
                          Header(player: widget.player),
                          const SizedBox(height: 20),
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
                    )),
    );
  }
}
