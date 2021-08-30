import 'package:covid19/homepage.dart';
import 'package:covid19/pages/countrypages.dart';
import 'package:covid19/pages/infomation.dart';
import 'package:covid19/pages/listfavorite.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Navigation extends StatefulWidget {
  @override
  __Navigation createState() => __Navigation();
}

class __Navigation extends State<Navigation> {
  int pageIndex = 0;
  final Infomation info = Infomation();
  final HomePage homepage = HomePage();
  final CountryPage countrypage = new CountryPage();
  final FavoList listFavorite = new FavoList();
  Widget showPage = new HomePage();

  Widget pageChoose(int page) {
    switch (page) {
      case 0:
        return homepage;

      case 1:
        return countrypage;
      case 2:
        return listFavorite;
      case 3:
        return info;
      default:
        return new HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    pageIndex;
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blueAccent,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.favorite, size: 30),
          Icon(Icons.info, size: 30),
        ],
        onTap: (int tabindex) {
          setState(() {
            showPage = pageChoose(tabindex);
          });
        },
      ),
      body: Container(
        color: Colors.blue,
        child: Center(
          child: showPage,
        ),
      ),
    );
  }
}
