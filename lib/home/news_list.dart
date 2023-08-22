import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/api/model/SourcesResponse.dart';
import 'package:news/api/model/news_response.dart';
import 'package:news/home/news_widget.dart';

class NewsList extends StatelessWidget {
  Source source;
  NewsList(this.source);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          FutureBuilder<NewsResponse>(
              future: ApiManager.getNewsBySourceId((source.id)!),
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

                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (_, index) {
                      return NewsWidget((data?.newsList![
                          index])!); // el proplem ely kanet wa2fa m3aya bsbb () lazem eldata klaha tb2a da5el (())
                    },
                    itemCount: data?.newsList?.length ?? 0,
                  ),
                );
              }),
        ],
      ),
    );
  }
}
