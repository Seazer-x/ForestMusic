import 'package:flutter/cupertino.dart';

class HorizontalScrollable extends StatelessWidget {
  const HorizontalScrollable({Key? key, required this.children})
      : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 10, bottom: 10),
      scrollDirection: Axis.horizontal,
      child: Row(children: children),
    );
  }
}
