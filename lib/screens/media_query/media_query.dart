import 'package:flutter/material.dart';
import 'package:myappdemo/themes/styles.dart';

class MediaQueryScreen extends StatefulWidget {
  @override
  _MediaQueryScreenState createState() => _MediaQueryScreenState();
}

class _MediaQueryScreenState extends State<MediaQueryScreen> {
  @override
  Widget build(BuildContext context) {

    // ตัวอย่างการอ่านขนาด กว่าง * สูง
    Size screenSize = MediaQuery.of(context).size;
    double screenSizeWidth = MediaQuery.of(context).size.width;
    double screenSizeHeight = MediaQuery.of(context).size.height;
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double appbarHeight = 56.0;

    return Scaffold(
      // Defalut Status bar = 24px
      // Defalut Appbar height = 56px
      
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appbarHeight),
        child:AppBar(
          title: Text('Media Query'),
        )
      ),
      body: Column(
        // child: Text('$screenSize', style: TextStyle(fontSize: 24),),
        children: [
          Container(
            color: Colors.green,
            // width: double.infinity, // กว้าง 100%
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Center(child: Text("Statusbar Height : $statusBarHeight \n Appbar Height : $appbarHeight \n Screen : $screenSize", style: TextStyle(fontSize: 24),))
          ),
          Container(
            color: Colors.orange,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Center(child: Text('Screen Width : ${screenSizeWidth.toStringAsFixed(2)}', style: TextStyle(fontSize: 24),))
          ),
          Container(
            color: Colors.purple,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4 - appbarHeight - statusBarHeight,
            child: Center(child: Text('Screen Height : ${screenSizeHeight.toStringAsFixed(2)}', style: TextStyle(fontSize: 24),))
          ),
        ],
      ),
    );
  }
}