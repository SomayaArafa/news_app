import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/data/repo/news_repo/news_repository_impl.dart';
import 'package:news_app/domain/model/source.dart';
import 'package:news_app/domain/use_cases/load_sources_usecase.dart';
import 'package:news_app/ui/utils/resource.dart';

import '../../../../../apis/api_manager.dart';
import '../../../../../data/model/remote_source.dart';
@injectable
class NewsViewModel extends Cubit<NewsState> {
  NewsViewModel(this.loadSourcesUseCase) : super(NewsState(Resource.initial()));
  LoadSourcesUseCase loadSourcesUseCase;

  loadSources(String category) async {
    try {
      emit(NewsState(Resource.loading()));

      var sources = await loadSourcesUseCase.call(category);
      //momken asheel word call de 3ady
      emit(NewsState(Resource.success(sources)));
    } catch (e) {
      emit(NewsState(Resource.error(e.toString())));
    }
  }
}

class NewsState {
  Resource<List<Source>> sourcesApi = Resource.initial();

  NewsState(this.sourcesApi);
}
