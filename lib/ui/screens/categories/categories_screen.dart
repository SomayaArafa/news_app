import 'package:flutter/material.dart';
import 'package:news_app/ui/utils/extention/context_extention.dart';
import 'package:news_app/ui/utils/extention/int_extensions.dart';
import 'package:news_app/ui/widgets/app_drawer.dart';
import 'package:provider/provider.dart';

import '../../../data/model/category.dart';
import '../../providers/theme_provider.dart';
import '../../utils/app_routes.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});
  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);

    return  Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Good Morning \nHere is Some News For You",
              style: context.textTheme.titleLarge,
              textAlign: TextAlign.start,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: AppCategory.categories.length,
                    itemBuilder: (context, index) {
                      return buildCategoryWidget(
                        context,
                        index,
                        AppCategory.categories[index],
                      );
                    }))
          ],
        ),
      ),
    );
  }
  buildCategoryWidget(BuildContext context, int index, AppCategory category) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          AppRoutes.newsScreen(category),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(themeProvider.isLightMode
                  ? category.imageDark
                  : category.imageLight),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                crossAxisAlignment: index.isEven
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Text(
                    category.name,
                    style: context.textTheme.displaySmall,
                  ),
                  38.verticalSpace(),
                  Container(
                    decoration: BoxDecoration(
                        color: context.primaryColor.withAlpha(125),
                        borderRadius: BorderRadius.circular(24)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (index.isEven) ...[
                          16.horizontalSpace(),
                          Text("View all"),
                          8.horizontalSpace(),
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: context.primaryColor,
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: context.secondaryColor,
                              size: 18,
                            ),
                          )
                        ],
                        if (index.isOdd) ...[
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: context.primaryColor,
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: context.secondaryColor,
                              size: 18,
                            ),
                          ),
                          8.horizontalSpace(),
                          Text("View all"),
                          16.horizontalSpace(),
                        ]
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
