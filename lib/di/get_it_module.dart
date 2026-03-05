import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../apis/api_manager.dart';

@module
abstract class GetItModule {
  Connectivity createConnectivity() => Connectivity();

  @lazySingleton
  Dio createDio() => Dio(BaseOptions(
      baseUrl: ApiManager.baseurl
  ));
}