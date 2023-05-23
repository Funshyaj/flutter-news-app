import 'package:flutter/cupertino.dart';

class Pad extends StatelessWidget {
  const Pad({Key? key, required this.widget, required this.ver, required this.hor}) : super(key: key);

  final Widget widget;
  final double ver;
  final double hor;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: hor, vertical: ver),
        child: widget);
  }
}
