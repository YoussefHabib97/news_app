import 'dart:developer';
import 'package:dio/dio.dart';

const apiKey = "670b9934e98d47e2ac36f3cf18031a64";

class NewsService {
  final Dio dio;
  NewsService(this.dio);

  void getNews() async {
    final response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=eg&category=general&apiKey=$apiKey');
    Map<String, dynamic> jsonData = response.data;
    // log(jsonData.toString());

    List<dynamic> articles = jsonData['articles'];
    log(articles.toString());
  }
}
