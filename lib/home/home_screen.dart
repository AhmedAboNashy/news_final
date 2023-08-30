import 'package:flutter/material.dart';
import 'package:news/home/home_side_menu.dart';
import 'package:news/home/news/news_fragment.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(fit: BoxFit.cover ,
              image: AssetImage('assets/images/background.png'))),
      child: Scaffold(drawer: Drawer(child: HomeSideMenu(),),
          appBar: AppBar(backgroundColor: Colors.green,
            title: Center(
              child: Text(
                'News',
                style: TextStyle(color: Colors.amber, fontSize: 30),
              ),
            ),
          ),

        body:
            NewsFragment()
          ),

    );
  }
}
