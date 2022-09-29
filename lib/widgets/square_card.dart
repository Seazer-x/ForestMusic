import 'package:flutter/material.dart';
import 'package:forest_music_app/theme.dart';

class SquareCard extends StatelessWidget {
  const SquareCard({
    Key? key,
    required this.photo,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title, photo, description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 140,
            height: 140,
            clipBehavior: Clip.hardEdge,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Image.network(photo),
          ),
          Text(title, style: primaryText),
          const SizedBox(
            height: 5,
          ),
          Text(description, style: secondaryText)
        ],
      ),
    );
  }
}
