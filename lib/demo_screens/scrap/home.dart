import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


class Data {
  final int userId;
  final int id;
  final String title;

  Data({required this.userId, required this.id, required this.title});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
int run(int n){
  return n;
}

var result = run(1);


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //declare an array variable to keep the list of data from the server
  late List newsList;
  late int amountOfNews;
int index = 0;
  @override
  void initState(){
    super.initState();
    // getData();
  }

  //to get data with dio
   getData()async{
    //create an instance for dio
    final dio = Dio();
//    make a network request
var res = await dio.get('https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=2b8f4f5e4195450c87a0ceeaf519d557');
//    validate the response and return error
if (res.statusCode == 200){
//  set the state of the array created above
setState(() {
  newsList = res.data['articles'] as List;
  amountOfNews = res.data['totalResults'] as int;
});
}else{
  if (kDebugMode) {
    print(res.statusCode);

  }}
  }

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return  Scaffold(
body:    Container(
  margin: const EdgeInsets.only(top: 90),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              //recommended for you text
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Tech news recommended for you',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontFamily: 'NunitoBold'
                  ),),
              ),


      //list of data
      FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          return Expanded(
            child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return
                    Container(
                // width: size.width,
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //post image set a background of this container
                    Container(
                      height: 100,width: 100,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                            image: NetworkImage(newsList[index]['urlToImage']),
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:  [
                          Text(newsList[index]['author'],
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12
                            ),),

                          const SizedBox(height: 10,),

                          Text(newsList[index]['title'],
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.left),

                          const SizedBox(height: 20,),

                          Text(newsList[index]['publishedAt'],
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey
                            ),),

                  ] ),
                    ),
                   ] )
                  );
                },
                itemCount:amountOfNews==null?0:amountOfNews
            ),
          );
        }
    ),
    ],
  ),
),

    bottomNavigationBar:
    BottomNavigationBar(
currentIndex: index,
    type: BottomNavigationBarType.fixed,
    onTap: (x){
  setState(() {
    index = x;
  });
    },
    items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
        icon: Icon(Icons.home),
    label: 'Home',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.explore),
    label: 'explore',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.person),
    label: 'profile',
    ),
    ],
    selectedItemColor: Colors.indigo[800],
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,

    ),

);
  }

}

