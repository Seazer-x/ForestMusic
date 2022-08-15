import 'package:flutter/material.dart';
import 'package:forest_music_app/pages/home/header.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const <Widget>[Header()],
    );
  }
}
