import 'package:flutter/material.dart';
import 'package:instagram/screen/main_screen.dart';
import 'package:instagram/screen/switch_account_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode focusInputeEmail = FocusNode();
  FocusNode focusInputePassword = FocusNode();

  @override
  void initState() {
    super.initState();
    focusInputeEmail.addListener(() {
      setState(() {});
    });
    focusInputePassword.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff323a99),
            Color(0xfff98bfc),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            _getImageContainer(),
            _getContainerBoxLogin(),
          ],
        ),
      ),
    );
  }

  Widget _getImageContainer() => Positioned(
        top: 80,
        right: 0,
        left: 0,
        bottom: 0,
        child: Column(
          children: [
            Expanded(
              child: Image(image: AssetImage("images/rocket.png")),
            ),
            Expanded(child: Container())
          ],
        ),
      );

  Widget _getContainerBoxLogin() => Column(
        children: [
          Expanded(child: Container()),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff1c1f2e),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "Sing in to",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Image(image: AssetImage("images/mood.png")),
                      ],
                    ),
                    SizedBox(height: 34),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 44),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        focusNode: focusInputeEmail,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            fontFamily: 'GM',
                            fontSize: 18,
                            color: focusInputeEmail.hasFocus
                                ? Color(0xfff35383)
                                : Colors.white,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Color(0xffc5c5c5),
                              width: 3,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Color(0xfff35383),
                              width: 3,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 44),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        focusNode: focusInputePassword,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            fontFamily: 'GM',
                            fontSize: 18,
                            color: focusInputePassword.hasFocus
                                ? Color(0xfff35383)
                                : Colors.white,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Color(0xffc5c5c5),
                              width: 3,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Color(0xfff35383),
                              width: 3,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 32),
                      width: 100,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xfff35383),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          textStyle: TextStyle(
                              fontFamily: 'GB',
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => MainScreen(),
                            ),
                          );
                        },
                        child: Text("sign in"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 32),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? / ",
                            style: TextStyle(
                              color: Color(0xff9c9c9c),
                            ),
                          ),
                          Text(
                            "Sign up",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      );

  @override
  void dispose() {
    super.dispose();
    focusInputeEmail.dispose();
    focusInputePassword.dispose();
  }
}
