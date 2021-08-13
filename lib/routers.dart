import 'package:flutter/material.dart';
import 'package:myappdemo/dashborad/dashborad_screen.dart';
import 'package:myappdemo/screens/addproduct/addproduct.dart';
import 'package:myappdemo/screens/drawer/about/about_screen.dart';
import 'package:myappdemo/screens/drawer/contact/contact_screen.dart';
import 'package:myappdemo/screens/drawer/term/term_screen.dart';
import 'package:myappdemo/screens/home/home_screen.dart';
import 'package:myappdemo/screens/login/login_screen.dart';
import 'package:myappdemo/screens/media_query/media_layout.dart';
import 'package:myappdemo/screens/media_query/media_query.dart';

Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  // "/": (BuildContext context) => MyHomePage(),
  "/media_query": (BuildContext context) => MediaQueryScreen(),
  "/media_layout": (BuildContext context) => MediaLayoutScreen(),
  "/login": (BuildContext context) => LoginScreen(),
  "/about": (BuildContext context) => AboutScreen(),
  "/contact": (BuildContext context) => ContactScreen(),
  "/term": (BuildContext context) => TermScreen(),
  "/dashboard": (BuildContext context) => DashboardScreen(),
  "/addproduct": (BuildContext context) => AddProductScreen(),
};
