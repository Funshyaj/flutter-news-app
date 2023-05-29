import 'package:News_Daily/app/app.locator.dart';
import 'package:News_Daily/models/post.dart';
import 'package:News_Daily/screens/main/home/home_viewmodel.dart';
import 'package:News_Daily/services/api_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDio extends Mock implements Dio{}

void main() {
  group('test api calls', () {

    test('getNewsHeadlines', ()async {
        // Create an instance of the mock Dio client
        final mockDio = MockDio();

        // Configure the mock Dio client's response for the API call
        when(mockDio.get('https://api.example.com/data'))
            .thenAnswer((_) async => Response(
            data:  {
              "source": '',
              "author": '',
              "title": '',
              "description": '',
              "url": '',
              "urlToImage": '',
              "publishedAt": '',
              "content": '',
            },
            statusCode: 200,
            requestOptions: RequestOptions(headers: {'auth':'headers'})
        ));

        // Create an instance of your ViewModel with the mock Dio client
        final viewModel = HomeViewModel();

        // Call the method that makes the API call
        await viewModel.futureToRun();

        // Verify that the ViewModel's data was updated correctly
        expect(viewModel.allNewsCategories, List<List<Article>>);


      // final fetchNewsServices = locator<ApiService>();
      // final exp = await fetchNewsServices.getHeadlines(mockDio);
      // //
      // expect(exp, List<Article>);

    });
    });
  }




