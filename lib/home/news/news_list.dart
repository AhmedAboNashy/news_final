import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/api/model/SourcesResponse.dart';
import 'package:news/api/model/news_response.dart';

import 'news_widget.dart';

class NewsList extends StatefulWidget {
  Source source;
  NewsList(this.source);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  int pageNnmber = 1;
  final scrollController = ScrollController();
  bool atBottom = false;
  List<News> news = [];

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop == true) {
          atBottom = true;
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          FutureBuilder<NewsResponse>(
              future: !atBottom
                  ? ApiManager.getNews(sourceId: widget.source.id ?? '')
                  : ApiManager.getNews(
                      sourceId: widget.source.id ?? '',page: ++pageNnmber,
                    ),
              builder: (_, snapShot) {
                if (snapShot.hasError) {
                  return Center(child: (Text('${snapShot.error.toString()}')));
                } else if (snapShot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator(color: Colors.blue));
                }

                var data = snapShot.data;

                //if error return ..

                if ('error' == data?.status) {
                  // lw data b error sever lazem hayrg3 message

                  return Center(child: Text('${data?.message}'));
                }
                news.addAll(data?.newsList ?? []);
                return Expanded(
                  child: ListView.separated(
                    controller: scrollController,
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    itemBuilder: (_, index) {
                      return NewsWidget(news[index]);
                      // el proplem ely kanet wa2fa m3aya bsbb () lazem eldata klaha tb2a da5el (())
                    },
                    itemCount: news.length,
                  ),
                );
              }),
        ],
      ),
    );
  }
}
