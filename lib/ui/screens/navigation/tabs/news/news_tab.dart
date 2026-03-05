import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/apis/api_manager.dart';
import 'package:news_app/data/mapper/sources_mapper.dart';
import 'package:news_app/data/model/category.dart';
import 'package:news_app/data/repo/news_repo/data_sources/local_data_sources/news_local_data_source.dart';
import 'package:news_app/data/repo/news_repo/data_sources/remote_data_sources/news_remote_data_source.dart';
import 'package:news_app/data/repo/news_repo/news_repository_impl.dart';
import 'package:news_app/di/di.dart';
import 'package:news_app/domain/model/source.dart';
import 'package:news_app/domain/use_cases/load_sources_usecase.dart';
import 'package:news_app/ui/screens/navigation/tabs/news/news_list.dart';
import 'package:news_app/ui/utils/resource.dart';
import 'package:news_app/ui/widgets/error_widget.dart';
import 'package:provider/provider.dart';

import '../../../../../data/model/remote_source.dart';
import 'news_view_model.dart';

class NewsTab extends StatefulWidget {
  const NewsTab({super.key, required this.category});

  final AppCategory category;

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  late NewsViewModel viewModel = getIt();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.loadSources(widget.category.name);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<NewsViewModel, NewsState>(
        builder: (context, state) {
          if (state.sourcesApi.status == ApiStatus.error) {
            return Text(state.sourcesApi.errMessage ?? '');
          } else if (state.sourcesApi.status == ApiStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return buildTabsList(state.sourcesApi.data ?? []);
          }
        },
      ),
    );
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
