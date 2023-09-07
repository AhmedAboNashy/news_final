import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/home/categories/categories.dart';

class CategoryWidget extends StatelessWidget {
  Category category;
  int index;
  CategoryWidget(this.category, this.index);
  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(4).r,
      decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(24.sp),
              topLeft: Radius.circular(24.sp),
              bottomLeft: Radius.circular(index.sp % 2 == 0 ? 24 : 0),
              bottomRight: Radius.circular(index.sp % 2 == 0 ? 0 : 24))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ('assets/images/${category.imageName}.png'),
            height: 90.h,
            fit: BoxFit.fill,
          ),
          Text(
            category.title,
            style: TextStyle(fontSize: 18.sp, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
