import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/apis/api_manager.dart';
import 'package:news_app/apis/model/category.dart';
import 'package:news_app/ui/screens/navigation/tabs/news/news_list.dart';
import 'package:news_app/ui/utils/resource.dart';
import 'package:news_app/ui/widgets/error_widget.dart';
import 'package:provider/provider.dart';

import '../../../../../apis/model/source.dart';
import 'news_view_model.dart';

class NewsTab extends StatefulWidget {
  const NewsTab({super.key, required this.category});

  final AppCategory category;

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  late NewsViewModel viewModel=NewsViewModel();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.loadSources(widget.category.name);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>viewModel,
    child: BlocBuilder<NewsViewModel,NewsState>(
      builder: (context,state){
    if(state.sourcesApi.status==ApiStatus.error){
                return Text(state.sourcesApi.errMessage??'');
              }
              else if(state.sourcesApi.status==ApiStatus.loading){
                return const Center(child: CircularProgressIndicator());
              }
              else{
                return buildTabsList(state.sourcesApi.data??[]);
              }
      },
    ),
    );
    // return ChangeNotifierProvider(
    //     create: (_) => NewsViewModel(),
    //     child: Builder(
    //       builder: (context) {
    //         // viewModel = Provider.of(context);
    //         return Consumer<NewsViewModel>(builder: (context, viewModel, _) {
    //           this.viewModel = viewModel;
    //           if(viewModel.sourcesApi.status==ApiStatus.error){
    //             return Text(viewModel.sourcesApi.errMessage??'');
    //           }
    //           else if(viewModel.sourcesApi.status==ApiStatus.loading){
    //             return const Center(child: CircularProgressIndicator());
    //           }
    //           else{
    //             return buildTabsList(viewModel.sourcesApi.data??[]);
    //           }
    //          // if(viewModel.errMessage.isNotEmpty){
    //          //   return Text(viewModel.errMessage);
    //          // }else if(viewModel.isLoading){
    //          //   return const Center(child: CircularProgressIndicator());
    //          // }
    //          // else{
    //          //   return buildTabsList(viewModel.sources);
    //          // }
    //         });
    //       },
    //     ));
    // return FutureBuilder(
    //     future: ,
    //     builder: (context, snapshot) {
    //       if (snapshot.hasError) {
    //         return AppErrorWidget(message: snapshot.error.toString());
    //       } else if (snapshot.hasData) {
    //         return buildTabsList(snapshot.data!);
    //       } else {
    //         return const Center(child: CircularProgressIndicator());
    //       }
    //     });
  }

  buildTabsList(List<Source> sources) {
    return DefaultTabController(
      length: sources.length,
      child: Column(
        children: [
          TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              tabs: sources
                  .map((source) => Tab(
                        child: Text(source.name ?? ''),
                      ))
                  .toList()),
          Expanded(
              child: TabBarView(
            children: sources
                .map((source) => NewsList(
                      source: source,
                    ))
                .toList(),
          ))
        ],
      ),
    );
  }
}
