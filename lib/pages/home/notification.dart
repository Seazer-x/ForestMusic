import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../theme.dart';

class NotificationArea extends StatelessWidget {
  const NotificationArea({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: screenSize.width,
          height: 240,
          decoration: BoxDecoration(
              color: primary.shade400,
              borderRadius:
                  const BorderRadius.only(bottomRight: Radius.circular(100))),
          child: Container(
              padding: const EdgeInsets.only(
                  top: 80, bottom: 19, left: 25, right: 25),
              child: SizedBox(
                  width: screenSize.width,
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "晚上好,",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "Seazer",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: <Widget>[
                          const Icon(
                            FontAwesomeIcons.solidBell,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          const SizedBox(
                            width: 18,
                          ),
                          Container(
                              width: 38,
                              height: 38,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(19)),
                              child: const Image(
                                width: 38,
                                height: 38,
                                image: AssetImage("lib/assets/images/bg3.png"),
                              )),
                        ],
                      )
                    ],
                  ))),
        ),
        Positioned(
            top: 10,
            left: 0,
            width: screenSize.width,
            child: Image(
                image: const AssetImage('lib/assets/images/bg1.png'),
                color: Colors.white.withOpacity(0.03)))
      ],
    ));
  }
}
