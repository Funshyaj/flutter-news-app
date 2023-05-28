// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:demo_app/app/app.locator.dart';
import 'package:demo_app/models/post.dart';
import 'package:demo_app/services/api_services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('test api calls', () async {

    final fetchNewsServices = locator<ApiService>();

    expect(fetchNewsServices.getStartUpNews(), Future<List<Article>>);
    // expect(fetchNewsServices.getBusinessNews(), Future<List<Article>>);
    // expect(fetchNewsServices.getHeadlines(), Future<List<Article>>);
    // expect(fetchNewsServices.getAfricaNews(), Future<List<Article>>);
    // expect(fetchNewsServices.getSportsNews(), Future<List<Article>>);

  });
}
