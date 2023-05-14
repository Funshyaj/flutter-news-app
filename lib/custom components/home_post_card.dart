import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard(this.author, this.title, this.description, this.url, this.urlToImage, this.publishedAt, this.content, {Key? key}) : super(key: key);

  final String? author;
  final String title;
  final String? description;
  final String url;
  final String? urlToImage;
  final String publishedAt;
  final String? content;



  @override
  Widget build(BuildContext context) {
    return   Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //post image set a background of this container
              Container(
                width: 120,height: 150,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      image: NetworkImage(urlToImage??'not available'),
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Text(author??'Unknown Author',
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12
                        ),),

                      const SizedBox(height: 4,),

                      Text(title,
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.left),

                      const SizedBox(height: 6,),

                      Text(description??'',
                        style:const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey
                        ),
                      overflow: TextOverflow.clip,
                      maxLines: 5,),

                      Text(publishedAt??"",
                        style:const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87
                        ),),

                    ] ),
              ),
            ]
    )
    );
  }
}
