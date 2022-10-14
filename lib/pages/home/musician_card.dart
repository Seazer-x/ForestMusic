import 'package:flutter/material.dart';
import 'package:forest_music_app/theme.dart';

class MusicianCard extends StatelessWidget {
  const MusicianCard({Key? key, required this.name, required this.photo})
      : super(key: key);

  final String name, photo;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Container(
          width: 100,
          height: 100,
          clipBehavior: Clip.hardEdge,
          margin: const EdgeInsets.only(bottom: 10, left: 10),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(120))),
          child: Image.network(photo)),
      Text(name, style: primaryText),
    ]);
  }
}
