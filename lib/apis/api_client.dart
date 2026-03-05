import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/apis/api_manager.dart';
import 'package:news_app/data/model/articles_response.dart';
import 'package:news_app/data/model/sources_response.dart';
import 'package:retrofit/retrofit.dart';
part 'api_client.g.dart';
@singleton
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio,) = _ApiClient;


  @GET("/v2/top-headlines/sources")
  Future<SourcesResponse> loadSources(
      @Query('category') String category, @Query('apiKey') String apiKey);

  @GET("/v2/everything")
  Future<ArticlesResponse> loadArticles(
      @Query('sources') String source, @Query('apiKey') String apiKey);
}
