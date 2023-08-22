import 'package:flutter/material.dart';
import 'package:news/api/model/SourcesResponse.dart';
import 'package:news/home/news_list.dart';
import 'package:news/home/source_tab.dart';

class SourcesTabs extends StatefulWidget {
  List<Source> sources;

  SourcesTabs(this.sources);

  @override
  State<SourcesTabs> createState() => _SourcesTabsState();
}

class _SourcesTabsState extends State<SourcesTabs> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
                onTap: (index) {
                  selectedTab = index;
                  setState(() {});
                },
                indicatorColor: Colors.transparent,
                // el line ely tht el tabs
                isScrollable: true,
                tabs: widget.sources.map((source) {
                  // lazem nhwlha el tabs l map
                  var isSelected = widget.sources.indexOf(source) == selectedTab;
                  return SourceTab(source, isSelected);
                }).toList()
            ),
            NewsList(widget.sources[selectedTab])
          ],
        ),
      ),
    );
  }
}
