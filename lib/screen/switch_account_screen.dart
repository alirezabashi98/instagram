import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instagram/screen/login_screen.dart';
import 'package:instagram/screen/main_screen.dart';

class SwitchAccountScreen extends StatelessWidget {
  const SwitchAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1c1f2e),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage("images/switch_account_background.png"),
                        fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  top: 130,
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                      child: Container(
                        height: 352,
                        width: 340,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromRGBO(255, 255, 255, 0.5),
                              Color.fromRGBO(255, 255, 255, 0.2),
                            ],
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 32,
                            ),
                            ClipRRect(borderRadius: BorderRadius.circular(15),child: Image(image: AssetImage('images/profile.png'),width: 130,height: 130,fit: BoxFit.cover,)),
                            SizedBox(
                              height: 20,
                            ),
                            Text('AlirezaBashi',
                                style: Theme.of(context).textTheme.headline4),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 46,
                              width: 129,
                              child: ElevatedButton(
                                style:
                                    Theme.of(context).elevatedButtonTheme.style,
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          LoginScreen(),
                                    ),
                                  );
                                },
                                child: Text('Continue',style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: 'GB',),),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text('switch account',
                                style: Theme.of(context).textTheme.headline4)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 53, bottom: 63),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? / ',
                    style: TextStyle(
                      fontFamily: 'GB',
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Sing up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
