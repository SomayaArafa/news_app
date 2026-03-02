import 'package:flutter/material.dart';
import 'package:news_app/apis/model/source.dart';
import 'package:news_app/ui/screens/navigation/tabs/news/news_widget.dart';

import '../../../../../apis/api_manager.dart';
import '../../../../../apis/model/article.dart';
import '../../../../widgets/error_widget.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key, required this.source});
final Source source;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.loadArticles(source.id!),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return AppErrorWidget(message: snapshot.error.toString());
          } else if (snapshot.hasData) {
            List<Article> articles = snapshot.data!;
            return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return NewsWidget(
                    article: articles[index],
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
