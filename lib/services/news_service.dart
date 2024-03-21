import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

// const apiKey = "670b9934e98d47e2ac36f3cf18031a64";

class NewsService {
  final Dio dio = Dio();
  NewsService();

  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
      var response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=eg&$category=general&apiKey=670b9934e98d47e2ac36f3cf18031a64',
      );

      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        ArticleModel articleModel = ArticleModel(
          image: article['urlToImage'],
          title: article['title'],
          subTitle: article['description'],
          source: Source(
            id: article['source']['id'],
            name: article['source']['name'],
          ),
        );

        articlesList.add(articleModel);
      }
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
