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
  bool shouldLoadNextPage = false;
  List<News> news = [];

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop ) {
          shouldLoadNextPage = true;
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
    if (shouldLoadNextPage) {
      ApiManager.getNews(sourceId: widget.source.id ?? '', page: ++pageNnmber)
          .then((newsResponse) {
        news.addAll(newsResponse.newsList ?? []);
        shouldLoadNextPage = false;
        setState(() {});
      });
    }
    print('news Length=> ${news.length}');
    print('page Number=> $pageNnmber');

    return Expanded(
      child: Column(
        children: [
          FutureBuilder<NewsResponse>(
              future: ApiManager.getNews(sourceId: widget.source.id ?? ''),
              builder: (_, snapShot) {
                var data = snapShot.data;
                if (snapShot.hasError) {
                  return Center(child: (Text('${snapShot.error.toString()}')));
                } else if ('error' == data?.status) {
                  return Center(child: Text('${data?.message}'));
                } else if (snapShot.hasData) {
                  if (news.isEmpty) {
                    news = data?.newsList ?? [];
                  }
                  if (data?.newsList?[0].title != news[0].title) {
                    scrollController.jumpTo(0);
                    news = data?.newsList ?? [];
                  }
                 return Expanded(
                    child: ListView.separated(
                      controller: scrollController,
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      itemBuilder: (_, index) {
                        print('index=> $index');
                        return NewsWidget(news[index]);
                        // el proplem ely kanet wa2fa m3aya bsbb () lazem eldata klaha tb2a da5el (())
                      },
                      itemCount: news.length,
                    ),
                  );
                } else
                  return Center(
                      child: CircularProgressIndicator(color: Colors.blue));
                }
              ),
        ],
      ),
    );
  }
}
