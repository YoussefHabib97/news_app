import 'package:flutter/material.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/error_message.dart';
import 'package:news_app/widgets/news_list_view.dart';

class NewsListViewBuilder extends StatelessWidget {
  const NewsListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NewsService().getNews(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverToBoxAdapter(
            child: Center(
              child: LinearProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasError) {
          ErrorMessage(
            message: snapshot.error.toString(),
          );
        }

        if (!snapshot.hasData) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Text("No Data to be displayed"),
            ),
          );
        }
        return NewsListView(articles: snapshot.data!);
      },
    );
  }
}
