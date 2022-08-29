import 'package:flutter/material.dart';
import 'package:instagram/screen/main_screen.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          headline4: TextStyle(
              fontSize: 16,
              fontFamily: 'GB',
              fontWeight: FontWeight.w700,
              color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Color(0xfff35383),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            textStyle: TextStyle(
                fontFamily: 'GB', fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MAinScreen(),
    );
  }
}
