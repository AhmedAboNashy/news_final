import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/api/model/SourcesResponse.dart';

class SourceTab extends StatelessWidget {
  Source source;
  bool selected;
  SourceTab(this.source, this.selected);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: selected ? Theme.of(context).primaryColor : Colors.transparent,
          border: Border.all(color: Theme.of(context).primaryColor, width: 2.w)),
      child: Text(
        source.name ?? '',
        style: TextStyle(
            color: selected ? Colors.white : Theme.of(context).primaryColor),
      ),
    );
  }
}
