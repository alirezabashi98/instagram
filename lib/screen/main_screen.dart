import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instagram/screen/activity_secreen.dart';
import 'package:instagram/screen/add_post_screen.dart';
import 'package:instagram/screen/home_screen.dart';
import 'package:instagram/screen/profile_screen.dart';
import 'package:instagram/screen/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedBottomNavigationItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color(0xff1c1f2e),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (int index) {
              setState(() {
                _selectedBottomNavigationItem = index;
              });
            },
            currentIndex: _selectedBottomNavigationItem,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  "images/icon_home.png",
                  width: 30,
                  height: 30,
                ),
                activeIcon: Image.asset(
                  "images/icon_active_home.png",
                  width: 30,
                  height: 30,
                ),
                label: "test",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "images/icon_search_navigation.png",
                  width: 30,
                  height: 30,
                ),
                activeIcon: Image.asset(
                  "images/icon_search_navigation_active.png",
                  width: 30,
                  height: 30,
                ),
                label: "test",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "images/icon_add_navigation.png",
                  width: 30,
                  height: 30,
                ),
                activeIcon: Image.asset(
                  "images/icon_add_navigation_active.png",
                  width: 30,
                  height: 30,
                ),
                label: "test",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "images/icon_activity_navigation.png",
                  width: 30,
                  height: 30,
                ),
                activeIcon: Image.asset(
                  "images/icon_activity_navigation_active.png",
                  width: 30,
                  height: 30,
                ),
                label: "test",
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Color(0xffc5c5c5),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset("images/profile.png"),
                    ),
                  ),
                ),
                activeIcon: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Color(0xfff35383),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset("images/profile.png"),
                    ),
                  ),
                ),
                label: "test",
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: _selectedBottomNavigationItem,
        children: _getLayout(),
      ),
    );
  }

  List<Widget> _getLayout() {
    return <Widget>[
      HomeScreen(),
      SearchScreen(),
      AddPostScreen(),
      ActivityScreen(),
      ProfileScreen(),
    ];
  }
}
