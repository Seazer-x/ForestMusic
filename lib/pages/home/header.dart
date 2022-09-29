import 'package:flutter/material.dart';
import 'package:forest_music_app/pages/home/notification.dart';

import '../../model/user.dart';
import 'category_banner.dart';

class Header extends StatelessWidget {
  final User user;
  const Header({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 370,
      child: Stack(
        children: <Widget>[
          NotificationArea(user: user),
          Column(
            children: const <Widget>[SizedBox(height: 140), CategoryBanner()],
          )
        ],
      ),
    );
  }
}
