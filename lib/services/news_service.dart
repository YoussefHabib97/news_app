import 'dart:developer';
import 'package:dio/dio.dart';

class NewsService {
  final Dio dio;
  NewsService(this.dio);

  void getNews() async {
    final response = await dio.get(
        'https://newsapi.org/v2/everything?q=bitcoin&apiKey=670b9934e98d47e2ac36f3cf18031a64');
    log(response.toString());
  }
}
