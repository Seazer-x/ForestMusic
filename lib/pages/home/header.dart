import 'package:flutter/material.dart';
import 'package:forest_music_app/pages/home/notification.dart';

import 'category_banner.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        NotificationArea(screenSize: screenSize),
        const CategoryBanner()
      ],
    );
  }
}
