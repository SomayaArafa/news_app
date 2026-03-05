import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/data/mapper/sources_mapper.dart';
import 'package:news_app/data/repo/news_repo/data_sources/local_data_sources/news_local_data_source.dart';
import 'package:news_app/data/repo/news_repo/data_sources/remote_data_sources/news_remote_data_source.dart';
import 'package:news_app/data/repo/news_repo/news_repository_impl.dart';
import 'package:news_app/di/di.config.dart';
import 'package:news_app/domain/repository/news_repository.dart';
import 'package:news_app/domain/use_cases/load_sources_usecase.dart';
import 'package:news_app/ui/screens/navigation/tabs/news/news_view_model.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void initDependencies() => getIt.init();

// initDependencies() {
//   getIt.registerFactory(()=>Connectivity());
//   getIt.registerFactory(()=>SourcesMapper());
//   getIt.registerFactory<NewsLocalDataSource>(()=>NewsLocalDataSourceImpl());
//   getIt.registerFactory<NewsRemoteDataSource>(()=>NewsRemoteDataSourceImpl());
//   getIt.registerFactory<NewsRepository>(() => NewsRepositoryImpl(
//       remoteDataSource: getIt(),
//       localDataSource: getIt(),
//       connectivity: getIt(),
//       sourcesMapper: getIt()));
//   getIt.registerFactory(() => LoadSourcesUseCase(getIt()));
//   getIt.registerFactory<NewsViewModel>(() => NewsViewModel(getIt()));
// }
