import 'package:flutter/material.dart';
import 'package:instagram/model/enums/activity_type_enum.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1c1f2e),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Color(0xff1c1f2e),
              height: 50,
              child: TabBar(
                controller: _tabController,
                indicatorWeight: 4,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 4),
                indicatorColor: Color(0xfff35383),
                labelStyle: TextStyle(fontSize: 16, fontFamily: "GB"),
                tabs: [
                  Tab(
                    text: "Following",
                  ),
                  Tab(
                    text: "You",
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _getSmpleList(),
                  _getSmpleList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getSmpleList() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 30),
            child: Text(
              "New",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontFamily: 'GB',
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getRow(
                index % 2 == 0
                    ? ActivityStatus.followingBack
                    : ActivityStatus.llkies,
              );
            },
            childCount: 2,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 30),
            child: Text(
              "Today",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontFamily: 'GB',
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getRow(
                index % 4 == 0
                    ? ActivityStatus.followingBack
                    : ActivityStatus.following,
              );
            },
            childCount: 8,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 30),
            child: Text(
              "This Week",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontFamily: 'GB',
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getRow(
                index % 6 == 0
                    ? ActivityStatus.followingBack
                    : ActivityStatus.llkies,
              );
            },
            childCount: 4,
          ),
        ),
      ],
    );
  }

  Widget _getRow(ActivityStatus status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
                color: Color(
                  0xfff35383,
                ),
                shape: BoxShape.circle),
          ),
          SizedBox(width: 10),
          SizedBox(
            width: 40,
            height: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset("images/profile.png"),
              ),
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Alirezabashi98",
                    style: TextStyle(
                      fontFamily: 'GB',
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Started following",
                    style: TextStyle(
                      fontFamily: 'GB',
                      fontSize: 10,
                      color: Color(0xffc5c5c5),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "you",
                    style: TextStyle(
                      fontFamily: 'GM',
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "3min",
                    style: TextStyle(
                      fontFamily: 'GB',
                      fontSize: 12,
                      color: Color(0xffc5c5c5),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          _getActivityRow(status),
        ],
      ),
    );
  }

  Widget _getActivityRow(ActivityStatus status) {
    switch (status) {
      case ActivityStatus.followingBack:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color(0xfff35383),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            textStyle: TextStyle(
                fontFamily: 'GB', fontSize: 14, fontWeight: FontWeight.w700),
          ),
          onPressed: () {},
          child: Text('follow'),
        );
      case ActivityStatus.llkies:
        return SizedBox(
          width: 40,
          height: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset("images/item1.png"),
            ),
          ),
        );
      case ActivityStatus.following:
        return OutlinedButton(
          onPressed: () {},
          child: Text(
            "message",
            style: TextStyle(
              fontFamily: 'GB',
              fontSize: 12,
              color: Color(0xffc5c5c5),
            ),
          ),
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: Color(0xffc5c5c5),
            ),
          ),
        );
      default:
        return SizedBox();
    }
  }
}
