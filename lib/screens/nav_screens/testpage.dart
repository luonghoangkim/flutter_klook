import 'dart:math';

import 'package:apptest/theme/app_color.dart';
import 'package:apptest/widgets/text_bg_radius.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late CarouselController _controller;
  int _currentImageIndex = 0;
  ScrollController _scrollController = ScrollController();
  bool isHeaderPinned = true;

  @override
  void initState() {
    super.initState();
    _controller = CarouselController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    setState(() {
      isHeaderPinned = _scrollController.position.pixels < 150;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imageUrls = [
      'img/img_hotel1.jpeg',
      'img/img_hotel1.jpeg',
      'img/img_hotel1.jpeg',
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            pinned: true,
            centerTitle: false,
            stretch: true,
            expandedHeight: 200.0,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [StretchMode.zoomBackground],
              background: Image.asset(
                'img/img_hotel1.jpeg',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Item $index'),
                    );
                  },
                ),
              ],
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            floating: false,
            delegate: _SliverAppBarDelegate(
              minHeight: 150.0,
              maxHeight: 150.0,
              child: Container(
                color: Colors.white,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    width: double.maxFinite,
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Flexible(
                              flex: 3,
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Thứ 4',
                                    ),
                                    Text(
                                      'Thứ 5',
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '17/1',
                                    ),
                                    Text(
                                      '-1 đêm-',
                                    ),
                                    Text(
                                      '18/1',
                                    ),
                                  ],
                                )
                              ]),
                            ),
                          ],
                        ),
                        const Divider(
                          thickness: 0.5,
                        ),
                        Wrap(
                          children: [
                            CustomBarWidget(
                              iconData: Icons.local_fire_department,
                              text: 'Giá tốt',
                              iconColor: AppColors.primaryColor,
                              textColor: AppColors.textTitleColor,
                              backgroundColor: AppColors.listTitleColor,
                              fontSize: 14,
                              onTap: () {},
                            ),
                            CustomBarWidget(
                              text: 'Bữa sáng miễn phí',
                              textColor: AppColors.textTitleColor,
                              backgroundColor: AppColors.listTitleColor,
                              fontSize: 14,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Item $index'),
                    );
                  },
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Item $index'),
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
