import 'package:flutter/cupertino.dart';

class Pad extends StatelessWidget {
  const Pad({Key? key, required this.widget, this.ver, this.hor}) : super(key: key);

  final Widget widget;
  final double ? ver;
  final double ? hor;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: hor ?? 0, vertical: ver ?? 0),
        child: widget);
  }
}
