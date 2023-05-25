
// To parse this JSON data, do
//
//     final bpost = bpostFromJson(jsonString);

import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  String status;
  int totalResults;
  List<Article> articles;

  Post({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    status: json["status"],
    totalResults: json["totalResults"],
    articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
  };
}

class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    source: Source.fromJson(json["source"]),
    author: json["author"],
    title: json["title"],
    description: json["description"],
    url: json["url"],
    urlToImage: json["urlToImage"],
    publishedAt: DateTime.parse(json["publishedAt"]),
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "source": source?.toJson(),
    "author": author,
    "title": title,
    "description": description,
    "url": url,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt?.toIso8601String(),
    "content": content,
  };
}

class Source {
  String? id;
  String name;

  Source({
    this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}




// class Post {
//   late String title;
//   late String description;
//   late String content;
//   late String urlOfFullPost;
//   late String publishedAt;
//   late String author;
//   late String urlToImage;
//
//   Post({required this.title,
//     required this.author,
//     required this.content,
//     required this.description,
//     required this.urlOfFullPost,
//     required this.publishedAt,
//     required this.urlToImage});
//
//
//   Post.fromJson(Map<String, dynamic> json) {
//       title = json['title'];
//     author = json['author'];
//     description =json['description'];
//     content = json['content'];
//     urlOfFullPost = json['url'];
//     urlToImage = json['urlToImage'];
//     publishedAt = json['publishedAt'];
//   }
//
//   Map<String, dynamic> toJson(){
//     final Map<String, dynamic> data = <String,dynamic>{};
//     data['title'] = title;
//     data['author'] = author;
//     data['description'] = description;
//     data['content'] = content;
//     data['url'] = urlOfFullPost;
//     data['urlToImage'] = urlToImage;
//     data['publishedAt'] = publishedAt;
//     return data;
//
//   }
//
// }