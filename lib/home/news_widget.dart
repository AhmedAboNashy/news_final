import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/my_date_utils.dart';
import '../api/model/news_response.dart';

class NewsWidget extends StatelessWidget {
  News news;
NewsWidget(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(30),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,children: [
        CachedNetworkImage(
          imageUrl: news.urlToImage??"",height: 230,width: double.infinity,fit: BoxFit.cover,
          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),

        Text(news.author??'',style: TextStyle(color: Color(0xff79828B),fontSize: 12),),
        Text(news.title??'',style: TextStyle(color: Color(0xff42505C),fontSize: 18,fontWeight: FontWeight.w500),),
        Text(MyDateUtils.formatNewsDate(news.publishedAt??''),style: TextStyle(color: Color(0xff79828B),fontSize: 12),textAlign: TextAlign.end,),
      ],
      ),
    );
  }
}
