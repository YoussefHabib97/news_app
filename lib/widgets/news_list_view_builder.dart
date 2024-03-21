import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({
    super.key,
  });

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  bool isLoading = true;
  List<ArticleModel> articles = [];

  Future<void> getGeneralNews() async {
    articles = await NewsService().getNews();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getGeneralNews();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const SliverToBoxAdapter(
            child: Center(
              child: LinearProgressIndicator(),
            ),
          )
        : articles.isNotEmpty
            ? NewsListView(articles: articles)
            : const SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    "Oops! There was an error.\nPlease try again later.",
                  ),
                ),
              );
  }
}
