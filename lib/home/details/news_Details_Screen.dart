import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/api/model/news_response.dart';
import 'package:news/my_date_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const routeName = 'newsDetails';

  @override
  Widget build(BuildContext context) {
    var screenHight = MediaQuery.of(context).size.height;
    News news = ModalRoute.of(context)!.settings.arguments as News;
// 3l4a n3ml navigate between NewsDetailsScreen & NEwsWidget
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(60),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(9.0),
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
              style: TextStyle(color: Color(0xff79828B), fontSize: 12),
              textAlign: TextAlign.end,
            ),
            SizedBox(height: screenHight * .05),
            Text(
              news.content ?? '',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: screenHight * .05),
            TextButton(
              onPressed: () {
                openUrl(news.url ?? '');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'View Full Article',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp),
                  ),
                  Icon(
                    Icons.navigate_next,
                    color: Colors.black,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  openUrl(String url) async {
    if (url == null) {
      return;
    }
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
