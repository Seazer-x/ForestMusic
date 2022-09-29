import 'package:flutter/material.dart';

import '../theme.dart';

class MusicCard extends StatelessWidget {
  const MusicCard({
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 10),
                width: 64,
                height: 64,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(64))),
                child: Image.network(cover),
              ),
              Positioned(
                  top: 24,
                  left: 34,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                  ))
            ],
          ),
          Container(
            padding: const EdgeInsets.only(right: 15),
            margin: const EdgeInsets.only(left: 9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(name, style: primaryText),
                const SizedBox(
                  height: 5,
                ),
                Text("$album - $artist", style: secondaryText)
              ],
            ),
          )
        ],
      ),
    );
  }
}
