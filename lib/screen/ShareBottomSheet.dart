import 'dart:ui';
import 'package:flutter/material.dart';

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({Key? key, this.controller}) : super(key: key);
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0),
        child: Container(
          color: Color.fromRGBO(255, 255, 255, 0.09),
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: _getContent(),
        ),
      ),
    );
  }

  Widget _getContent() {
    // return GridView.builder(
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //     mainAxisSpacing: 22,
    //     crossAxisSpacing: 22,
    //     crossAxisCount: 4,
    //   ),
    //   itemBuilder: (BuildContext context, index) {
    //     return Container(
    //       color: Colors.amber,
    //     );
    //   },
    // );

    return CustomScrollView(
      controller: controller,
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Container(
                width: 67,
                height: 5,
                margin: EdgeInsets.only(top: 10, bottom: 22),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Shared",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'GB',
                      color: Colors.white,
                    ),
                  ),
                  Image.asset("images/icon_share_bottomsheet.png")
                ],
              ),
              SizedBox(height: 32),
              Container(
                height: 46,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.4),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Image.asset("images/icon_search.png"),
                      SizedBox(width: 8),
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      )),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                color: Colors.amber,
              );
            },
            childCount: 100,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 22,
            crossAxisSpacing: 22,
            crossAxisCount: 4,
          ),
        ),
      ],
    );
  }
}
