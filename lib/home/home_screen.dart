import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/api/model/news_response.dart';
import 'package:news/home/categories/categories.dart';
import 'package:news/home/home_side_menu.dart';
import 'package:news/home/news/news_fragment.dart';
import 'package:news/home/news/news_widget.dart';
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
              style: TextStyle(color: Colors.amber, fontSize: 30.sp),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(60.sp),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: NewsSearch(),
                );
              },
              icon: Icon(
                Icons.search,
                size: 32.sp,
              ),
            ),
            SizedBox(
              width: 20.w,
            )
          ],
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

class NewsSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: Icon(
            Icons.search,
            size: 25.r,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.clear,
          size: 25.sp,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<NewsResponse>(
            future: ApiManager.getNews(searchKeyword: query),
            builder: (_, snapShot) {
              if (snapShot.hasError) {
                return Center(child: (Text('${snapShot.error.toString()}')));
              } else if (snapShot.connectionState == ConnectionState.waiting) {
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
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  itemBuilder: (_, index) {
                    return NewsWidget((data?.newsList![
                        index])!); // el proplem ely kanet wa2fa m3aya bsbb () lazem eldata klaha tb2a da5el (())
                  },
                  itemCount: data?.newsList?.length ?? 0,
                ),
              );
            }),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(child: Text('Suggestions'));
  }
}
