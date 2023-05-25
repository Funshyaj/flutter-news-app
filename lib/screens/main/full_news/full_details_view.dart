import 'package:flutter/material.dart';

class FullDetails extends StatelessWidget {
  const FullDetails({Key? key, required this.title, this.author, this.description, this.url, this.urlToImage, this.publishedAt, this.content}) : super(key: key);

  final String ? author;
  final String ? title;
  final String ? description;
  final String ? url;
  final String ? urlToImage;
  final String ? publishedAt;
  final String ? content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
            child: Text('$title $description')
        )
    );
  }
}
