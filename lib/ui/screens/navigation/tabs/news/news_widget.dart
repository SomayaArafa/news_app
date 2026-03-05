import 'package:flutter/material.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/ui/utils/extention/context_extention.dart';
import 'package:news_app/ui/utils/extention/int_extensions.dart';

class NewsWidget extends StatelessWidget {

  const NewsWidget({super.key, required this.article, });
final Article article;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: context.secondaryColor),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
               article.urlToImage??'',
              height: MediaQuery.of(context).size.height * .2,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          12.verticalSpace(),
          Text(
             article.title??'',
            style: context.textTheme.bodyMedium,
          ),
          12.verticalSpace(),
          Row(
            children: [
              Expanded(
                child: Text(
                  "By :${article.author}",
                  style: context.textTheme.labelMedium,
                ),
              ),
              10.horizontalSpace(),
              Text(
                "${article.publishedAt}",
                style: context.textTheme.labelMedium,
              ),
            ],
          )
        ],
      ),
    );
  }
}