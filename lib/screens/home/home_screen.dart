import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.green,
          // backgroundColor: Color.fromARGB(0xff, 230, 300, 390), //กำหนดสีแบบ ARGB
          // backgroundColor: Color.fromRGBO(230, 300, 390, 0.5), //กำหนดสีแบบ RGBO
          // backgroundColor: Color(0xffb74093),
          leading: Icon(Icons.home),
          title: Text('home'),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: (){
                print('you click notifications');
              }
            )
          ],
        ),
        body: Center(
          child: Text("Hello flutter")
        ),
      );
  }
}
