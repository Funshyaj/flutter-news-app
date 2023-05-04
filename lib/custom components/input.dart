import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input({Key? key, required this.label, required this.placeholderTxt, required this.controller}) : super(key: key);

  final String label;
  final String placeholderTxt;
  final TextEditingController controller;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
        Text(label,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600]
            )
        ),
        const SizedBox(height: 10,),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            // prefixIcon: const Icon(Icons.person_2_outlined)
            hintText: placeholderTxt,
          ),
        ),
      ]
      ),
    );
  }
}

