import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/pattern1.png"),
            repeat: ImageRepeat.repeat),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 80),
                child: Image(
                  image: AssetImage('images/logo_splash.png'),
                ),
              ),
            ),
            Positioned(
              bottom: 32,
              child: Column(
                children: [
                  Text(
                    "from",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "Alfa",
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


//Column(
          //   children: [
          //     Expanded(
          //       child: Center(
          //         child: 
          //       ),
          //     ),
          
          //     SizedBox(
          //       height: 32,
          //     )
          //   ],
          // )),