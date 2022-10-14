import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forest_music_app/api/playlist.dart';
import 'package:forest_music_app/model/playlist.dart';
import 'package:forest_music_app/theme.dart';
import 'package:path_provider/path_provider.dart';

import '../../model/music.dart';
import '../../widgets/music_ver.dart';
import '../../widgets/vertical_scrollable.dart';
import '../playlist/header.dart';

class PlayListDetail extends StatefulWidget {
  final AudioPlayer player;
  const PlayListDetail({Key? key, required this.player}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _PlayListDetailState();
}

class _PlayListDetailState extends State<PlayListDetail> {
  late Future<Playlist> futurePlayList;
  late List<Music> musicList;
  late int musicIndex = 0;

  @override
  void initState() {
    super.initState();
    futurePlayList = playlistdetail("006c46abc67e19262616757bf20a356f");
  }

  @override
  Widget build(BuildContext context) {
    final player = widget.player;
    return Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: const Icon(FontAwesomeIcons.angleLeft),
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: "",
            );
          }),
        ),
        body: FutureBuilder<Playlist>(
            future: futurePlayList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Playlist playlist = snapshot.data!;
                musicList = playlist.musicList;
                return SingleChildScrollView(
                  child: Stack(
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Header(
                              name: playlist.name,
                              cover: playlist.cover,
                              description: playlist.description,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                PrimaryButton(
                                    width: 221,
                                    press: () async {
                                      await player.play(
                                          UrlSource(musicList[musicIndex].url));
                                      await player.seek(
                                          const Duration(milliseconds: 0));
                                    },
                                    child: Row(children: const [
                                      SizedBox(width: 55),
                                      Icon(FontAwesomeIcons.circlePlay,
                                          size: 30),
                                      SizedBox(width: 20),
                                      Text("Play",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold))
                                    ])),
                                const SizedBox(width: 10),
                                PrimaryButton(
                                    color: const Color(0xFFF0F4F8),
                                    press: () async {
                                      /// 获取app文件地址
                                      Directory? storageDir =
                                          await getApplicationSupportDirectory();
                                      String? storagePath = storageDir.path;
                                      String filepath;
                                      for (var e in musicList) {
                                        filepath =
                                            "$storagePath/music${e.url.substring(e.url.lastIndexOf("/"))}";
                                        File file = File(filepath);
                                        if (!await file.exists()) {
                                          await file.create(recursive: true);
                                        }
                                        if (!file.existsSync()) {
                                          file.createSync();
                                        }
                                        try {
                                          await Dio().download(e.url, filepath,
                                              onReceiveProgress:
                                                  (num received, num total) {
                                            /// 获取下载进度
                                            double process = double.parse(
                                                (received / total)
                                                    .toStringAsFixed(2));
                                            if (kDebugMode) {
                                              print(process);
                                            }
                                          });
                                        } on DioError catch (e) {
                                          if (kDebugMode) {
                                            print(
                                                "response.statusCode: ${e.type}");
                                          }
                                        }
                                      }
                                    },
                                    child: const Icon(
                                        FontAwesomeIcons.cloudArrowDown,
                                        size: 22))
                              ],
                            ),
                            const SizedBox(height: 30),
                            VerticalScrollable(
                                children: musicList
                                    .map<Widget>((item) => MusicCardVertical(
                                          name: item.name,
                                          cover: item.cover,
                                          album: 'HOYO Mix',
                                          artist: item.singer,
                                        ))
                                    .toList())
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Center(child: CircularProgressIndicator()),
                ],
              );
            }));
  }
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key? key,
      required this.child,
      this.width = 44,
      this.radius = 10,
      this.color = buttonColor,
      required this.press})
      : super(key: key);

  final Widget child;
  final double width;
  final double radius;
  final Color color;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(radius)))),
          fixedSize: MaterialStateProperty.all<Size>(Size(width, 44))),
      child: child,
    );
  }
}
