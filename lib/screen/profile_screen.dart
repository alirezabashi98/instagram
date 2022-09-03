import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1c1f2e),
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  // pinned: true,
                  // toolbarHeight: 100,
                  actions: [
                    Padding(
                      padding: EdgeInsets.only(right: 17, top: 17),
                      child: Icon(Icons.menu),
                    ),
                  ],
                  bottom: PreferredSize(
                    child: Container(
                      height: 14,
                      decoration: BoxDecoration(
                        color: Color(0xff1c1f2e),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                    ),
                    preferredSize: Size.fromHeight(10),
                  ),
                  backgroundColor: Color(0xff1c1f2e),
                  expandedHeight: 170,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                      "images/background.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: _getProfile(),
                ),
                SliverPersistentHeader(
                  floating: true,
                  pinned: true,
                  delegate: TabBarViewDelegate(
                    TabBar(
                      indicatorWeight: 2,
                      indicatorPadding: EdgeInsets.only(bottom: 5),
                      indicatorColor: Color(0xfff35383),
                      tabs: [
                        Tab(
                          icon: Image.asset("images/icon_tab_posts.png"),
                        ),
                        Tab(
                          icon: Image.asset("images/icon_tab_bookmark.png"),
                        ),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: EdgeInsets.only(top: 10),
                      sliver: SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => Container(
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: FittedBox(
                                  fit: BoxFit.cover,
                                  child:
                                      Image.asset("images/item${index}.png")),
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
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(2, 2),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: EdgeInsets.only(top: 10),
                      sliver: SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => Container(
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: FittedBox(
                                  fit: BoxFit.cover,
                                  child:
                                      Image.asset(_getPostSave()[index<10 ? index : index~/10],),),
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
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(2, 2),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<String> _getPostSave() => [
    "images/post_cover01.png",
    "images/post01.png",
    "images/item1.png",
    "images/post08.png",
    "images/item3.png",
    "images/item4.png",
    "images/post_cover02.png",
    "images/post_cover03.png",
    "images/item8.png",
    "images/item7.png",
  ];

  Widget _getProfile() {
    return Column(
      children: [
        _getHeaderProfile(),
        _getDescriptionProfile(),
        Container(
          width: double.infinity,
          height: 46,
          margin: EdgeInsets.symmetric(horizontal: 17, vertical: 32),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(width: 2.0, color: Colors.white),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () {},
            child: Text(
              "Insights",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'GB',
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        _getHighlightProfile(),
      ],
    );
  }

  Container _getHighlightProfile() {
    return Container(
      height: 120,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) =>
          index == 0 ? _getAddHighlightBox() : _getHighlightBox(index-1)),
    );
  }

  Widget _getHighlightBox(int index) {
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
                child: Image.asset(_getDataFaceImage()[index]),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            _getDataFaceName()[index],
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

  List<String> _getDataFaceImage() {
    return [
      "images/highlight01.png",
      "images/highlight02.png",
      "images/highlight03.png",
      "images/highlight04.png",
    ];
  }

  List<String> _getDataFaceName() {
    return [
      "Flutter Vip",
      "Support",
      "Shoping",
      "Projects",
      "Projects",
    ];
  }

  Widget _getAddHighlightBox() {
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
                border: Border.all(color: Colors.white,width: 2),
                color: Color(0xff1c1f2e),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset('images/icon_plus.png'),
            ),
            SizedBox(height: 10),
            Text(
              "New",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

  Widget _getDescriptionProfile() {
    return Padding(
      padding: EdgeInsets.only(left: 17, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            """❤ | عاشق برنامه نویسی موبایل 😎
🚀 | عاشق لینوکس 💣
💻 | اندروید کاتلین لینوکس و فلاتر ✌""",
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontFamily: 'SM',
            ),
          ),
          SizedBox(height: 7),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "images/link.png",
                width: 20,
                height: 20,
              ),
              SizedBox(width: 5),
              Text(
                "zil.ink/alirezabashi98",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12,
                  fontFamily: 'GB'
                ),
              ),
            ],
          ),
          SizedBox(height: 14),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "images/Group.png",
                width: 20,
                height: 20,
              ),
              SizedBox(width: 5),
              Text(
                "developer",
                style: TextStyle(
                    color: Color(0xffC5C5C5), fontSize: 12, fontFamily: 'GB'),
              ),
              SizedBox(width: 15),
              Image.asset(
                "images/location.png",
                width: 20,
                height: 20,
              ),
              SizedBox(width: 5),
              Text(
                "IRAN",
                style: TextStyle(
                    color: Color(0xffC5C5C5), fontSize: 12, fontFamily: 'GM'),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Text(
                "32",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'GB',
                ),
              ),
              SizedBox(width: 5),
              Text(
                "Posts",
                style: TextStyle(
                    color: Colors.white, fontSize: 10, fontFamily: 'GM'),
              ),
              SizedBox(width: 15),
              Text(
                "16.2K",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'GB',
                ),
              ),
              SizedBox(width: 5),
              Text(
                "Followers",
                style: TextStyle(
                    color: Colors.white, fontSize: 10, fontFamily: 'GM'),
              ),
              SizedBox(width: 15),
              Text(
                "280",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'GB',
                ),
              ),
              SizedBox(width: 5),
              Text(
                "Following",
                style: TextStyle(
                    color: Colors.white, fontSize: 10, fontFamily: 'GM'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _getHeaderProfile() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Color(0xfff35383),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.all(2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset("images/profile.png"),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, top: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "علیرضا باشی برنامه نویس موبایل",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SM',
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "alirezabashi98",
                  style: TextStyle(
                    color: Color(0xffc5c5c5),
                    fontFamily: 'GB',
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Image.asset("images/icon_profile_edit.png"),
        ],
      ),
    );
  }

class TabBarViewDelegate extends SliverPersistentHeaderDelegate {
  TabBarViewDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Color(0xff1c1f2e),
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
