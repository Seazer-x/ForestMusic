import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  const TabItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.activeIcon,
    required this.active,
  }) : super(key: key);

  final Icon icon;
  final String title;
  final Icon activeIcon;
  final bool active;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        active ? activeIcon : icon,
        const SizedBox(height: 3),
        Text(title)
      ],
    );
  }
}
