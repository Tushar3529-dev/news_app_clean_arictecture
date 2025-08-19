/* import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_clean_arictecture/featuers/domain/entites/article.dart';

class ArticleWidget extends StatelessWidget {
  final ArticleEntity? article;
  const ArticleWidget({super.key, this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(
          start: 14, end: 14, bottom: 14, top: 14),
      height: MediaQuery.of(context).size.width / 2.2,
      child: Row(
        children: [
          _buildImage(context),
          _buildTitleAndDescription(),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: article!.urlToImage!,
      imageBuilder: (context, imageProvider) => Padding(
        padding: const EdgeInsetsDirectional.only(end: 14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            width: MediaQuery.of(context).size.width / 3,
            height: double.maxFinite,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.08),
                image:
                    DecorationImage(image: imageProvider, fit: BoxFit.cover)),
          ),
        ),
      ),
      progressIndicatorBuilder: (context, url, progress) => Padding(
        padding: const EdgeInsetsDirectional.only(end: 14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            20.0,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width / 3,
            height: double.maxFinite,
            child: const CupertinoActivityIndicator(),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.08),
            ),
          ),
        ),
      ),
      errorWidget: (context, url, error) => Padding(
        padding: const EdgeInsetsDirectional.only(end: 14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            width: MediaQuery.of(context).size.width / 3,
            height: double.maxFinite,
            child: const Icon(Icons.error),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.08),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndDescription() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(article!.title! ?? "",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontFamily: "Butler",
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                    color: Colors.black87)),
            //Description
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  article!.description! ?? "",
                  maxLines: 2,
                ),
              ),
            ),

            //Datetime
            Row(
              children: [
                const Icon(
                  Icons.timeline_outlined,
                  size: 16,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  article!.publishedAt!,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
} */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_clean_arictecture/featuers/domain/entites/article.dart';

class ArticleWidget extends StatelessWidget {
  final ArticleEntity? article;
  const ArticleWidget({super.key, this.article});

  @override
  Widget build(BuildContext context) {
    // Check if article is null and return a placeholder
    if (article == null) {
      return Center(child: Text('No article available')); // Placeholder message
    }

    return Container(
      padding: const EdgeInsetsDirectional.only(
          start: 14, end: 14, bottom: 14, top: 14),
      height: MediaQuery.of(context).size.width / 2.2,
      child: Row(
        children: [
          _buildImage(context),
          _buildTitleAndDescription(),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    if (article?.urlToImage == null) {
      return Container(); // Placeholder for image
    }

    return CachedNetworkImage(
      imageUrl: article!.urlToImage!,
      imageBuilder: (context, imageProvider) => Padding(
        padding: const EdgeInsetsDirectional.only(end: 14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            width: MediaQuery.of(context).size.width / 3,
            height: double.maxFinite,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.08),
                image:
                    DecorationImage(image: imageProvider, fit: BoxFit.cover)),
          ),
        ),
      ),
      progressIndicatorBuilder: (context, url, progress) => Padding(
        padding: const EdgeInsetsDirectional.only(end: 14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            width: MediaQuery.of(context).size.width / 3,
            height: double.maxFinite,
            child: const CupertinoActivityIndicator(),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.08),
            ),
          ),
        ),
      ),
      errorWidget: (context, url, error) => Padding(
        padding: const EdgeInsetsDirectional.only(end: 14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            width: MediaQuery.of(context).size.width / 3,
            height: double.maxFinite,
            child: const Icon(Icons.error),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.08),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndDescription() {
    if (article == null) {
      return Container(); // Placeholder for title and description
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(article!.title ?? "No Title",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontFamily: "Butler",
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                    color: Colors.black87)),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  article!.description ?? "No Description",
                  maxLines: 2,
                ),
              ),
            ),
            Row(
              children: [
                const Icon(
                  Icons.timeline_outlined,
                  size: 16,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  article!.publishedAt ?? "Unknown Date",
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
