import 'package:flutter/material.dart';
import 'package:news/home/categories/categories.dart';
import 'package:news/home/home_side_menu.dart';
import 'package:news/home/news/news_fragment.dart';
import 'package:news/home/settings/settings.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/background.png'))),
      child: Scaffold(
        drawer: Drawer(
          child: HomeSideMenu(onSideMenuItemClick),
        ),
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.green,
          title: Center(
            child: Text(
              'News',
              style: TextStyle(color: Colors.amber, fontSize: 30),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(60),
            ),
          ),
        ),
        body: currentWidget,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    currentWidget = CattegoriesFragment(onCategoryClick);
  }

  late Widget currentWidget;
  void onCategoryClick(Category category) {
    currentWidget = NewsFragment(category);
    setState(() {});
  }

  void onSideMenuItemClick(int type) {
    if (type == HomeSideMenu.Categories) {
      currentWidget = CattegoriesFragment(onCategoryClick);
    } else if (type == HomeSideMenu.Settings) {
      currentWidget = SettingsFragment();
    }
    setState(() {});
    Navigator.pop(context);
  }
}
