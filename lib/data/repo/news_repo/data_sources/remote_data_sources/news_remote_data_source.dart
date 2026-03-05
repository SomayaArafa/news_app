import 'package:injectable/injectable.dart';
import 'package:news_app/apis/api_manager.dart';

import '../../../../../apis/api_client.dart';
import '../../../../model/remote_source.dart';
import '../../../../model/sources_response.dart';

@Injectable(as: NewsRemoteDataSource)
class NewsRemoteDataSourceImpl extends NewsRemoteDataSource {
  ApiClient apiClient;

  NewsRemoteDataSourceImpl(this.apiClient);

  @override
  Future<List<RemoteSource>> loadSources(String categoryName) async {
    SourcesResponse sourcesResponse =
        await apiClient.loadSources(categoryName, ApiManager.apiKey);
    return sourcesResponse.sources!;
  }
}

abstract class NewsRemoteDataSource {
  Future<List<RemoteSource>> loadSources(String categoryName);
}
