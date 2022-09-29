import 'package:flutter/material.dart';
import 'package:forest_music_app/theme.dart';

class MusicianCard extends StatelessWidget {
  const MusicianCard(
      {Key? key,
      required this.category,
      required this.name,
      required this.photo})
      : super(key: key);

  final String name, photo, category;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 120,
          height: 120,
          clipBehavior: Clip.hardEdge,
          margin: const EdgeInsets.only(bottom: 10, left: 20),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(120))),
          child: Image.network(photo),
        ),
        Text(
          name,
          style: primaryText,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          category,
          style: secondaryText,
        )
      ],
    );
  }
}
