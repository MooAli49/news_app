import 'package:flutter/material.dart';
import 'package:news_app/core/model/news_model.dart';
import 'package:news_app/core/style/app_styles.dart';
import 'package:news_app/core/theme/colors_manger.dart';

class LatestNewsItem extends StatelessWidget {
  const LatestNewsItem({super.key, required this.newsModel});
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0),
      width: MediaQuery.of(context).size.width * 0.75,
      height: 200,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        children: [
          Image.network(
            newsModel.imageUrl,
            fit: BoxFit.cover,
            height: 120,
            width: double.infinity,
            errorBuilder:
                (context, error, stackTrace) => Image.network(
                  'https://i.quotev.com/b2gtjqawaaaa.jpg',
                  fit: BoxFit.cover,
                  height: 120,
                  width: double.infinity,
                ),
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                height: 120,
                width: double.infinity,
                color: Colors.grey[300],
                child: const Center(child: CircularProgressIndicator()),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              newsModel.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: AppStyles.font14Weight600,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    newsModel.author,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: AppStyles.font9Weight800.copyWith(
                      color: ColorsManger.lightGreyColor,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    newsModel.publishedAt,
                    style: AppStyles.font9Weight800Yellow,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
