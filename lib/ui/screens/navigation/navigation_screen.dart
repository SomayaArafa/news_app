import 'package:flutter/material.dart';
import 'package:news_app/apis/model/category.dart';
import 'package:news_app/ui/providers/theme_provider.dart';
import 'package:news_app/ui/screens/navigation/tabs/news/news_tab.dart';
import 'package:news_app/ui/widgets/app_drawer.dart';
import 'package:provider/provider.dart';

import '../../utils/app_colors.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen(this.category,{super.key, });
final AppCategory category;
  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
      ),
      drawer: const AppDrawer(),
      body:  NewsTab(category: widget.category,),
    );
  }


}
