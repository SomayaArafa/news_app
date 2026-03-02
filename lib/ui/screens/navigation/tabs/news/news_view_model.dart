
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/ui/utils/resource.dart';

import '../../../../../apis/api_manager.dart';
import '../../../../../apis/model/source.dart';

class NewsViewModel extends Cubit<NewsState> {
  // Resource <List<Source>> sourcesApi=Resource.initial();
NewsViewModel():super(NewsState(Resource.initial()));
//   List<Source> sources = [];
// bool isLoading=false;
// String errMessage='';
  loadSources(String category) async {
    try{
      emit(NewsState(Resource.loading()));
      // sourcesApi=Resource.loading();
      // notifyListeners();
      // isLoading=true;
      var sources = await ApiManager.loadSources(category);
      // sourcesApi=Resource.success(sources);
emit( NewsState(Resource.success(sources)));
    }catch(e){
      // sourcesApi=Resource.error(e.toString());
      emit(NewsState(Resource.error(e.toString())));
    }
    // notifyListeners();
  }
}
class NewsState{
  Resource <List<Source>> sourcesApi=Resource.initial();
NewsState(this.sourcesApi);
}