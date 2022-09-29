import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forest_music_app/api/playlist.dart';
import 'package:forest_music_app/model/playlist.dart';
import 'package:forest_music_app/theme.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

import '../../model/music.dart';
import '../../widgets/music_ver.dart';
import '../../widgets/vertical_scrollable.dart';
import '../playlist/header.dart';

class PlayListDetail extends StatefulWidget {
  const PlayListDetail({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PlayListDetailState();
}

class _PlayListDetailState extends State<PlayListDetail> {
  late Future<Playlist> futurePlayList;
  late List<Music> musicList;
  late bool _playing = false;
  late bool _pausing = false;
  final player = AudioPlayer();
  int audioIndex = 0;
  int seconds = 0;

  @override
  void initState() {
    super.initState();
    futurePlayList = playlistdetail("006c46abc67e19262616757bf20a356f");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(FontAwesomeIcons.angleLeft),
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: "返回",
            );
          }),
        ),
        body: FutureBuilder<Playlist>(
            future: futurePlayList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Playlist playlist = snapshot.data!;
                musicList = playlist.musicList;
                final musicality = ConcatenatingAudioSource(
                    useLazyPreparation: true,
                    // Customise the shuffle algorithm
                    shuffleOrder: DefaultShuffleOrder(),
                    // Specify the playlist items
                    children: musicList
                        .map((e) => AudioSource.uri(
                              Uri.parse(e.url),
                              tag: MediaItem(
                                // Specify a unique ID for each media item:
                                id: e.id,
                                // Metadata to display in the notification:
                                album: "Album name",
                                title: e.name,
                                artUri: Uri.parse(e.cover),
                              ),
                            ))
                        .toList());
                player.setAudioSource(musicality);
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
                                      Timer.periodic(const Duration(seconds: 1),
                                          (timer) {
                                        if (_pausing) {
                                          return;
                                        }
                                        seconds++;
                                      });
                                      if (!_playing) {
                                        setState(() {
                                          if (audioIndex !=
                                              player.currentIndex) {
                                            audioIndex = player.currentIndex!;
                                            seconds = 0;
                                          }
                                        });
                                        if (_pausing) {
                                          if (kDebugMode) {
                                            print(seconds);
                                          }
                                          await player.play();
                                          await player.seek(
                                              Duration(seconds: seconds),
                                              index: audioIndex);
                                        } else {
                                          player.play();
                                        }
                                        setState(() {
                                          _pausing = false;
                                          _playing = true;
                                        });
                                      } else {
                                        await player.pause();
                                        setState(() {
                                          _pausing = true;
                                          _playing = false;
                                        });
                                      }
                                    },
                                    child: Row(children: [
                                      const SizedBox(width: 55),
                                      Icon(
                                          _playing
                                              ? FontAwesomeIcons.circlePause
                                              : FontAwesomeIcons.circlePlay,
                                          size: 30),
                                      const SizedBox(width: 20),
                                      Text(_playing ? "Pause" : "Play",
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold))
                                    ])),
                                const SizedBox(width: 10),
                                PrimaryButton(
                                    color: const Color(0xFFF0F4F8),
                                    press: () {},
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
