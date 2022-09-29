import 'package:flutter/cupertino.dart';

class VerticalScrollable extends StatelessWidget {
  const VerticalScrollable({Key? key, required this.children})
      : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 10),
      scrollDirection: Axis.vertical,
      child: Column(children: children),
    );
  }
}
