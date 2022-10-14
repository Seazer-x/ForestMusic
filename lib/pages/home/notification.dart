import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:forest_music_app/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../theme.dart';

class NotificationArea extends StatefulWidget {
  const NotificationArea({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NotificationAreaState();
}

class _NotificationAreaState extends State<NotificationArea> {
  String greet = "";
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static late User user;

  greeting() {
    var hour = DateTime.now().hour;
    if (hour < 11) {
      greet = '早上好!';
    } else if (hour >= 11 && hour <= 12) {
      greet = '中午好!';
    } else if (hour < 17) {
      greet = '下午好!';
    } else {
      greet = '晚上好!';
    }
  }

  void initPref() async {
    final SharedPreferences prefs = await _prefs;
    Map jsonUser = jsonDecode(prefs.getString("user") ?? "");
    user = User(
        id: jsonUser['id'] ?? "",
        nickname: jsonUser['nickname'] ?? "",
        avatar: jsonUser['avatar'] ?? "",
        msg: jsonUser['msg'] ?? "",
        locked: jsonUser['locked'] ?? 0);
  }

  @override
  void initState() {
    greeting();
    initPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 240,
          decoration: BoxDecoration(
              color: primary.shade400,
              borderRadius:
                  const BorderRadius.only(bottomRight: Radius.circular(100))),
          child: Container(
              padding: const EdgeInsets.only(
                  top: 40, bottom: 19, left: 25, right: 25),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              greet,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 17,
                              ),
                            ),
                            Text(
                              user.nickname,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        const Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.only(left: 2),
                              height: 50,
                              width: 50,
                              child: ClipOval(
                                  child: Image.network(
                                user.avatar,
                                width: 60,
                                height: 60,
                              )),
                            ),
                          ],
                        )
                      ]))),
        ),
        Positioned(
            top: 10,
            left: 0,
            child: Image(
                width: MediaQuery.of(context).size.width,
                height: 240,
                image: const AssetImage('assets/images/bg1.png'),
                color: Colors.white.withOpacity(0.03)))
      ],
    );
  }
}
