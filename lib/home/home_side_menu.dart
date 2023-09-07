import 'package:flutter/material.dart';

class HomeSideMenu extends StatelessWidget {
  static const Settings = 10;
  static const Categories = 20;
  Function onItemClickCallBack;
  HomeSideMenu(this.onItemClickCallBack);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 50),
          alignment: Alignment.center,
          color: Theme.of(context).primaryColor,
          child: Text(
            'News',
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500),
          ),
        ),
        InkWell(
          onTap: () {
            onItemClickCallBack(Categories);
          },
          child: Row(
            children: [
              ImageIcon(
                AssetImage('assets/images/ic_category.png'),
                size: 30,
              ),
              Text(
                'Categories',
                style: TextStyle(
                    color: Color(0XFF303030),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),

        InkWell(onTap: (){
          onItemClickCallBack(Settings);
        },
          child: Row(
            children: [
              ImageIcon(
                AssetImage('assets/images/ic_setting.png'),
                size: 30,
              ),
              Text(
                'Settings',
                style: TextStyle(
                    color: Color(0XFF303030),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        )
      ],
    );
  }
}
