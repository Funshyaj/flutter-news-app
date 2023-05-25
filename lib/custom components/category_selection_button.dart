import 'package:flutter/material.dart';

class CategorySelectionButton extends StatelessWidget {
  const CategorySelectionButton({Key? key,  required this.text, required this.bg, required this.txt, }) : super(key: key);

  final String text;
  final Color bg;
  final Color txt;


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    margin: const EdgeInsets.only(left: 20),
    decoration:  BoxDecoration(
    color: bg,
    borderRadius: const BorderRadius.all(Radius.circular(
    50)),),
      child:  Center(child:
      Text(text,
        style: TextStyle(fontSize: 18,
            color: txt),)),
    );

  }

}


