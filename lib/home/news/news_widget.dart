import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/home/details/news_Details_Screen.dart';
import 'package:news/my_date_utils.dart';
import '../../api/model/news_response.dart';

class NewsWidget extends StatelessWidget {
  News news;
  NewsWidget(this.news);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .pushNamed(NewsDetailsScreen.routeName, arguments: news),
      child: Container(
        padding: EdgeInsets.all(9.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18.0),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? "",
                height: 225.h,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Text(
              news.author ?? '',
              style: TextStyle(color: Color(0xff79828B), fontSize: 12.sp),
            ),
            Text(
              news.title ?? '',
              style: TextStyle(
                  color: Color(0xff42505C),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 30.h),
            Text(
              MyDateUtils.formatNewsDate(news.publishedAt ?? ''),
              style: TextStyle(color: Color(0xff79828B), fontSize: 12.sp),
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }
}
