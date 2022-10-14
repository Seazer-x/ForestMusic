import 'package:flutter/cupertino.dart';

import '../../theme.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.name,
    required this.cover,
    required this.description,
  }) : super(key: key);

  final String name;
  final String cover;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: 260, height: 160, child: Image.network(cover)),
          Text(
            name,
            style: const TextStyle(fontSize: 18, color: primaryTextColor),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            description,
            style: const TextStyle(fontSize: 12, color: secondaryTextColor),
          )
        ],
      ),
    );
  }
}
