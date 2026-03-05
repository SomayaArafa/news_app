import 'package:dio/dio.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/data/model/articles_response.dart';
import 'package:news_app/data/model/remote_source.dart';
import 'package:news_app/data/model/sources_response.dart';

abstract final class ApiManager {
  static const apiKey = "8712683db49847d2a957c1bdd6f53d60";
  static const baseurl = "https://newsapi.org";
  static const sourcesEndPoint = "/v2/top-headlines/sources";
  static const articlesEndPoint = "/v2/everything";

  static Future<List<RemoteSource>> loadSources(String categoryName) async {
    final dio = Dio();
    // Response response =
    //     await dio.get('$baseurl$sourcesEndPoint?apiKey=$apiKey&category=$categoryName');
    Response response =
    await dio.get("$baseurl$sourcesEndPoint", queryParameters: {
      "apiKey": apiKey,
      "category": categoryName,
    });
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      Map json = response.data;
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      return sourcesResponse.sources!;
    }
    throw 'Something went wrong';
  }

  static Future<List<Article>> loadArticles(String sourceId) async {
    final dio = Dio();
    Response response = await dio
        .get('$baseurl$articlesEndPoint?apiKey=$apiKey&sources=$sourceId');
    print(
        "loadSources:response.statusCode= ${response.statusCode} response: ${response.data}");
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      Map json = response.data;
      ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
      return articlesResponse.articles!;
    }
    throw 'Something went wrong';
  }
}
