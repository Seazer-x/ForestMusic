import 'package:flutter/material.dart';
import 'package:forest_music_app/pages/home/notification.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return NotificationArea(screenSize: screenSize);
  }
}
