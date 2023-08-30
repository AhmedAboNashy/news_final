import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/home/news/sources_tabs.dart';
import '../../api/model/SourcesResponse.dart';

class NewsFragment extends StatelessWidget {
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
          children: [
            FutureBuilder<SourcesResponse>(
                future: ApiManager.getNewsSources(),
                builder: (buildContext, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: (Text('${snapshot.error.toString()}')));
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator(color: Colors.blue));
                  }
                  var data=snapshot.data;
                  //if error return ..

                  if('error'==data?.status){
                    return Center(child: Text('${data?.message}'));
                  }
                  var sources=data?.sources;
                  // if succes return ...
                  return SourcesTabs(sources!);
                })

          ]),
    );
  }
}
