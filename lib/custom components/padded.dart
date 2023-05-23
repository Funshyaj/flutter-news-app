import 'package:flutter/cupertino.dart';

class Padded extends StatelessWidget {
  const Padded({Key? key, required this.widget}) : super(key: key);

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        child: widget);
  }
}
