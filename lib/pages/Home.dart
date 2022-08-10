import 'package:flutter/material.dart';

import '../theme.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          width: 480,
          height: 240,
          padding: const EdgeInsets.only(left: 400),
          decoration: BoxDecoration(
              color: primary.shade400,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100))),
          child: SizedBox(
            width: screenSize.width,
            height: 70,
          )),
    );
  }
}
