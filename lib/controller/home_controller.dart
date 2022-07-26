import 'dart:convert';

import 'package:get/get.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  var dataNews = [].obs;

  Future getDataNew() async {
    var url =
        'https://newsapi.org/v2/everything?q=tesla&from=2022-06-26&sortBy=publishedAt&apiKey=61f62b87029c4585b8c2c2bb765517c2';

    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);
    dataNews.value = data['articles'];
  }

  @override
  void onInit() {
    getDataNew();
    super.onInit();
  }
}
