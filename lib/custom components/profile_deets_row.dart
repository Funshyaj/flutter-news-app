import 'package:flutter/cupertino.dart';

class DeetsRow extends StatelessWidget {
  const DeetsRow({Key? key, required this.icon, required this.text, required this.themeColor}) : super(key: key);

  final IconData icon;
  final String text;
  final Color? themeColor;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: Row(children: [
        Icon(icon,
          size: 40,
          color: themeColor),
        Expanded(child: Text(text,
          style: TextStyle(
              fontSize: 20,
              color: themeColor,
              fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.center,),)
      ]),
    );
  }
}


