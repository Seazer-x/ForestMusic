import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:forest_music_app/model/user.dart';

import '../../theme.dart';

class NotificationArea extends StatelessWidget {
  final User user;
  const NotificationArea({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String greet = "";
    greeting() {
      var hour = DateTime.now().hour;
      if (kDebugMode) {
        print(hour);
      }
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

    greeting();

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
                  top: 80, bottom: 19, left: 25, right: 25),
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
                    ],
                  ))),
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
