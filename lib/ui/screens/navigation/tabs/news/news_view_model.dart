
import 'package:flutter/material.dart';
import 'package:news_app/ui/utils/resource.dart';

import '../../../../../apis/api_manager.dart';
import '../../../../../apis/model/source.dart';

class NewsViewModel extends ChangeNotifier {
  Resource <List<Source>> sourcesApi=Resource.initial();

//   List<Source> sources = [];
// bool isLoading=false;
// String errMessage='';
  loadSources(String category) async {
    try{
      sourcesApi=Resource.loading();
      // isLoading=true;
      var sources = await ApiManager.loadSources(category);
      sourcesApi=Resource.success(sources);

    }catch(e){
      sourcesApi=Resource.error(e.toString());
    }
    notifyListeners();
  }
}