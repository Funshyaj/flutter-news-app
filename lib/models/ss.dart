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