import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double height , width;

  const Box({Key? key, required this.padding, required this.height, required this.width,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.withAlpha(40),width: 2,)
      ),
      padding: padding,
  child: Center(child:child)
  );
}
}