import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/home/categories/categories.dart';
import 'package:news/home/news/sources_tabs.dart';
import '../../api/model/SourcesResponse.dart';

class NewsFragment extends StatefulWidget {
  // todo double home here and home screen and splash screen
  static const String routeName = 'home';
  Category category;
  NewsFragment(this.category);

  @override
  State<NewsFragment> createState() => _NewsFragmentState();
}

class _NewsFragmentState extends State<NewsFragment> {
  @override
  void initState() {
    print(widget.category.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(children: [
        FutureBuilder<SourcesResponse>(
            future: ApiManager.getNewsSources(widget.category.id),
            builder: (buildContext, snapshot) {
              if (snapshot.hasError) {
                  print(snapshot.error);
              } else if (snapshot.connectionState ==
                  ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(color: Colors.blue));
              }
              var data = snapshot.data;
              //if error return ..

              if ('error' == data?.status) {
                return Center(child: Text('${data?.message}'));
              }

              var sources = data?.sources;
              // if succes return ...
              return SourcesTabs(sources!);
            })
      ]),
    );
  }
}
