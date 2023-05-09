import 'package:demo_app/custom%20components/post_card.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'explore_viewmodel.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ExploreViewModel>.reactive
      (viewModelBuilder: () => ExploreViewModel(),
      onViewModelReady:(model)=> model.fetch(),
      builder: (context, model, child) =>
      Scaffold(
        body:
            SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text('Business news',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text('Sport news',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),),
                    ),


FutureBuilder(
    future: model.fetch(),
    builder: (context, snapshot) {return
      ListView.builder(itemBuilder: (context, int index) {
        // return
        // return PostCard(
        //     model.posts
        //     model.posts[index].title,
        //     model.posts[index].description,
        //     model.posts[index].url,
        //     model.posts[index].urlToImage,
        //     model.posts[index].publishedAt.toString(),
        //     model.posts[index].content);
      });

    })

                  ],
                ),
              ),
            )
        //recommended for you text


      ),
    );
  }
}