import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1c1f2e),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _getSearchBox(),
            ),
            SliverToBoxAdapter(
              child: _getStoryList(),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(_getDataSearch()[index],fit: BoxFit.cover,),
                    ),
                  ),
                  childCount: 10,
                ),
                gridDelegate: SliverQuiltedGridDelegate(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  repeatPattern: QuiltedGridRepeatPattern.inverted,
                  pattern: [
                    QuiltedGridTile(2, 1),
                    QuiltedGridTile(2, 2),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getSearchBox() => Container(
        margin: EdgeInsets.only(right: 18, left: 18, top: 12),
        height: 46,
        decoration: BoxDecoration(
          color: Color(0xff272b40),
          borderRadius: BorderRadius.circular(13),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Image.asset("images/icon_search.png"),
              SizedBox(width: 15),
              Expanded(
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Search User",
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(width: 15),
              Image.asset("images/icon_scan.png"),
            ],
          ),
        ),
      );

  List<String> _getDataSearch() {
    return [
      "images/search01.png",
      "images/search02.png",
      "images/search03.png",
      "images/search04.png",
      "images/search05.png",
      "images/search06.png",
      "images/search07.png",
      "images/search08.png",
      "images/search09.png",
      "images/search10.png",
    ];
  }

  List<String> _getCategory() {
    return [
      "All",
      "Account",
      "Hashtag",
      "Caption",
      "Story",
      "Comment",
    ];
  }

  Widget _getStoryList() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      height: 23,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Color(0xff272b40),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
              child: Text(
                _getCategory()[index],
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'GM',
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
