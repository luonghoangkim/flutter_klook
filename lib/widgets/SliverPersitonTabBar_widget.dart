import 'package:flutter/material.dart';
import 'scroll_position_notifier.dart';

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final TabController tabController;
  final ScrollPositionNotifier scrollNotifier;

  MySliverPersistentHeaderDelegate(this.tabController, this.scrollNotifier) {
    scrollNotifier.addListener(() {
      tabController.animateTo(
        (scrollNotifier.scrollPosition / maxExtent * 4).round(),
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  double get minExtent => 50.0;

  @override
  double get maxExtent => 50.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(5),
            child: TabBar(
              isScrollable: true,
              labelColor: Colors.blue,
              indicatorColor: Colors.blue,
              dividerColor: Colors.transparent,
              unselectedLabelColor: Colors.black,
              controller: tabController,
              tabs: [
                Tab(child: Text('Đề xuất')),
                Tab(child: Text('Gần đây')),
                Tab(child: Text('Du lịch nước ngoài')),
                Tab(child: Text('Không nên bỏ lở')),
                Tab(child: Text('Chổ ở tiện nghi')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
