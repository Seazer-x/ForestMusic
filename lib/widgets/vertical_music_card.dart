import 'package:flutter/material.dart';

import '../theme.dart';

class VerticalMusicCard extends StatelessWidget {
  const VerticalMusicCard({
    Key? key,
    required this.cover,
    required this.name,
    required this.album,
    required this.artist,
  }) : super(key: key);

  final String cover, name, album, artist;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Stack(children: <Widget>[
                Container(
                    width: 64,
                    height: 64,
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(64))),
                    child: Image.network(cover))
              ]),
              Container(
                  padding: const EdgeInsets.only(right: 15),
                  margin: const EdgeInsets.only(left: 9),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(name, style: primaryText),
                        const SizedBox(height: 5),
                        Text("$album - $artist", style: secondaryText)
                      ]))
            ]));
  }
}
