import 'package:flutter/material.dart';
import 'package:news/home/categories/category_widget.dart';

class CattegoriesFragment extends StatelessWidget {
  List<Category> categories = Category.getAllCategories();
  Function onCategoryClickCAllback;
  CattegoriesFragment(this.onCategoryClickCAllback);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
        itemBuilder: (_, index) {
          return InkWell(
              onTap: () {
                print(categories[index].id);
                onCategoryClickCAllback(categories[index]);
              },
              child: CategoryWidget(categories[index], index));
        },
        itemCount: categories.length,
      ),
    );
  }
}

class Category {
  String id;
  String title;
  String imageName;
  Color color;
  Category(this.id, this.title, this.color, this.imageName);
  static List<Category> getAllCategories() {
    // entertainment  general  health  science  sports  technology category  business
    //todo .. lazem Category tb2a zy ely gaya mn api nfs name
    return [
      Category('sports', 'Sports', Color(0XFFC91C22), 'sports'),
      Category('general', 'General', Color(0XFF003E90), 'general'),
      Category('health', 'Health', Color(0XFFED1E79), 'health'),
      Category('business', 'Business', Color(0XFFCF7E48), 'bussines'),
      Category('technology', 'Technology', Color(0XFF4882CF), 'technology'),
      Category('science', 'Science', Color(0XFFF2D352), 'science'),
    ];
  }
}
