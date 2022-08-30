import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:instagram/screen/ShareBottomSheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1c1f2e),
      appBar: _getAppBarHome(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _getStoryList(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Column(
                    children: [
                      _getPostList(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _getStoryList() {
    return Container(
      height: 120,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) =>
              index == 0 ? _getAddStoryBox() : _getStoryBox()),
    );
  }

  ListView _getPostList() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 9,
      itemBuilder: (context, index) => _getPost(context),
    );
  }

  Column _getPost(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 34),
        _getHeaderPost(),
        SizedBox(height: 24),
        _getBodyPost(context),
      ],
    );
  }

  Container _getBodyPost(BuildContext context) {
    return Container(
      width: 394,
      height: 440,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            top: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset("images/post_cover.png"),
            ),
          ),
          Positioned(
            right: 15,
            top: 15,
            child: Image.asset('images/icon_video.png'),
          ),
          Positioned(
            bottom: 15,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                child: Container(
                  height: 46,
                  width: 340,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromRGBO(255, 255, 255, 0.5),
                        Color.fromRGBO(255, 255, 255, 0.2),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'images/icon_hart.png',
                          ),
                          SizedBox(width: 6),
                          Text(
                            "2.5k",
                            style: TextStyle(
                                fontFamily: 'GB',
                                fontSize: 14,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 15),
                          Image.asset(
                            'images/icon_comments.png',
                          ),
                          SizedBox(width: 6),
                          Text(
                            "1.5k",
                            style: TextStyle(
                                fontFamily: 'GB',
                                fontSize: 14,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            barrierColor: Colors.transparent,
                            backgroundColor: Colors.transparent,
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom,
                                ),
                                child: DraggableScrollableSheet(
                                  initialChildSize: 0.5,
                                  minChildSize: 0.2,
                                  maxChildSize: 0.7,
                                  builder: (context, controler) {
                                    return ShareBottomSheet(
                                      controller: controler,
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                        child: Image.asset(
                          'images/icon_share.png',
                        ),
                      ),
                      Image.asset(
                        'images/icon_save.png',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getHeaderPost() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          _getProfileBox(),
          Padding(
            padding: EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'alirezabashi98',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'GB',
                  ),
                ),
                Text(
                  'علیرضا باشی برنامه نویس موبایل',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SM',
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Image.asset('images/icon_menu.png')
        ],
      ),
    );
  }

  AppBar _getAppBarHome() {
    return AppBar(
      backgroundColor: Color(0xff1c1f2e),
      elevation: 0,
      centerTitle: false,
      title: Container(
        width: 128,
        height: 24,
        child: Image.asset('images/moodinger_logo.png'),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 18),
          height: 24,
          width: 24,
          child: Image.asset('images/icon_direct.png'),
        )
      ],
    );
  }

  Widget _getStoryBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(17),
            padding: EdgeInsets.all(4),
            color: Color(0xfff35383),
            strokeWidth: 2,
            dashPattern: [10, 10],
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: Container(
                height: 58,
                width: 58,
                child: Image.asset('images/profile.png'),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Alireza",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget _getProfileBox() {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(17),
      padding: EdgeInsets.all(4),
      color: Color(0xfff35383),
      strokeWidth: 2,
      dashPattern: [10, 10],
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Container(
          height: 38,
          width: 38,
          child: Image.asset('images/profile.png'),
        ),
      ),
    );
  }

  Widget _getAddStoryBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Padding(
        padding: EdgeInsets.all(2),
        child: Column(
          children: [
            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                color: Color(0xff1c1f2e),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset('images/icon_plus.png'),
            ),
            SizedBox(height: 10),
            Text(
              "Your Story",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
