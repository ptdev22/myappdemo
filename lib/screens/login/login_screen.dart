import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myappdemo/services/rest_api.dart';
import 'package:myappdemo/themes/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email, password;

  // Loading...
  bool _isLoading = false;
  // Alert Dialog
  showAlertDialog(BuildContext context, String msg) {
    AlertDialog alert = AlertDialog(
      title: Text('Login Status'),
      content: Text(msg),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'))
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 70),
          child: Text(
            'Logo',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildEmailRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        controller: mailController,
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          setState(() {
            email = value;
          });
        },
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.email,
              color: appTheme().primaryColor,
            ),
            labelText: 'E-mail'),
      ),
    );
  }

  Widget _buildPasswordRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        controller: passwordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: appTheme().primaryColor,
          ),
          labelText: 'Password',
        ),
      ),
    );
  }

  Widget _buildForgetPasswordButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FlatButton(
          onPressed: () {},
          child: Text(
            "Forgot Password",
            style: TextStyle(color: appTheme().primaryColor),
          ),
        )
      ],
    );
  }

  Widget _buildLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            elevation: 5.0,
            color: appTheme().primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            // onPressed: (){
            //   print('Email : $email\n Password : $password');
            // },
            onPressed: _login,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildOrRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Text(
            "- OR -",
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildSocialBtnRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: appTheme().primaryColor,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0)
                ]),
            child: Icon(FontAwesomeIcons.facebookF, color: Colors.white),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0)
                ]),
            child: Icon(FontAwesomeIcons.google, color: Colors.white),
          ),
        ),
      ],
    );
  }

  // การรวม Widget ด้านบนทั้งหมดเข้ามา
  Widget _buildContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6 + 200,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ],
                ),
                _buildEmailRow(),
                _buildPasswordRow(),
                _buildForgetPasswordButton(),
                _buildLoginButton(),
                _buildOrRow(),
                _buildSocialBtnRow()
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: _isLoading
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(
                            height: 20,
                          ),
                          Text('กำลังตรวจสอบข้อมูล')
                        ],
                      ),
                    ),
                  )
                : Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          decoration: BoxDecoration(
                              color: appTheme().primaryColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: const Radius.circular(70),
                                  bottomRight: const Radius.circular(70))),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildLogo(),
                          _buildContainer(),
                        ],
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  // // ส่วนของการ login
  // void _login() async {

  //   setState(() {
  //     _isLoading = true;
  //   });

  //   // API -------------------------------------------
  //   // รับค่ามาเก็บ
  //   var userData = {
  //     'email': mailController.text,
  //     'password': passwordController.text
  //   };
  //   print(userData);
  //   if(passwordController.text=='123456'){
  //   // สร้างตัวเก็บข้อมูลแบบ SharedPreferences
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   sharedPreferences.setString("storeName", 'Tawatchai');
  //   sharedPreferences.setString("storeEmail", mailController.text);
  //      setState(() {
  //       _isLoading = false;
  //     });
  //     Navigator.pushReplacementNamed(context, '/dashboard');

  //   }else{
  //     // ซ่อน Loading
  //     setState(() {
  //       _isLoading = false;
  //     });
  //     showAlertDialog(context, "รหัสผ่านไม่ถูกต้อง");
  //   }

  //   // // Call API
  //   // var response = await CallAPI().postData(userData, 'login');
  //   // var body = json.decode(response);
  //   // print(body);
  // }

  void _login() async {
    // สร้างตัวเก็บข้อมูลแบบ SharedPreferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    // แสดง Loading
    setState(() {
      _isLoading = true;
    });
    // try {
    //   // รับค่ามาเก็บลอง list
    //   var userData = {
    //     'email': mailController.text,
    //     'password': passwordController.text
    //   };

    //   // Call API
    //   var response = await CallAPI().postData(userData, 'login');
    //   var body = json.decode(response.body);
    //   print(body);

    // if (body['status'] == 'success') {
    //   // ซ่อน Loading
    //   setState(() {
    //     _isLoading = false;
    //   });
    //   // print('Login success');
    //   showAlertDialog(context, "Login Success");

    //   // การสร้างตัวแปรเก็บลง sharedPreferences
    //   var fullname =
    //       '${body['data']['prename'] + body['data']['firstname'] + " " + body['data']['lastname']}';
    //   sharedPreferences.setString("storeName", fullname);

    //   sharedPreferences.setString("storeEmail", body['data']['email']);
    sharedPreferences.setString("storeName", 'Tawatchai Lekyan');

    sharedPreferences.setString("storeEmail", mailController.text);
    //   // ส่งไปหน้า dashboard
    Navigator.pushNamed(context, '/dashboard');
    //   } else {
    //     // ซ่อน Loading
    //     setState(() {
    //       _isLoading = false;
    //     });
    //     // print('Login fail');
    //     showAlertDialog(context, "Login Fail!");
    //   }
    // } catch (error) {
    //   print(error);
    //   showAlertDialog(context, "พบข้อผิดพลาดการโหลดข้อมูล");

    //   setState(() {
    //     _isLoading = false;
    //   });
    //   Navigator.pushNamed(context, '/dashboard');
    //   // Fluttertoast.showToast(
    //   //     msg: "พบข้อผิดพลาดการโหลดข้อมูล",
    //   //     toastLength: Toast.LENGTH_SHORT,
    //   //     gravity: ToastGravity.BOTTOM,
    //   //     timeInSecForIosWeb: 1,
    //   //     backgroundColor: Colors.red,
    //   //     textColor: Colors.white,
    //   //     fontSize: 16.0
    //   // );
    // }
  }
}
