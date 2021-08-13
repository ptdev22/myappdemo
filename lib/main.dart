
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myappdemo/routers.dart';
import 'package:myappdemo/screens/home/home_screen.dart';
import 'package:myappdemo/themes/styles.dart';

void main(){
  HttpOverrides.global = new MyHttpOverrides();
  runApp(
    // DevicePreview(
    //   builder: (context) => MyApp()
    // ) //ทดสอบโดยใช้อุปกรอื่น
    MyApp()
  );
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
class MyApp extends StatelessWidget {
  const MyApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // locale: DevicePreview.of(context).locale,
      // builder: DevicePreview.appBuilder,
      theme: appTheme(),
      // home: MyHomePage(),
      initialRoute: '/dashboard',
      routes: routes,
    );
  }
}
