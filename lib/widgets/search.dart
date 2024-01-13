import 'package:apptest/screens/nav_screens/search_location_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:klook/components/small_text.dart';
// import 'package:klook/mocs/data_search.dart';
// import 'package:klook/pages/search/search.dart';

class AppBarHome extends StatefulWidget {
  final double _variableValue;
  final double _variableValue2;
  final double _opacity;
  final List<dynamic> itemList;

  // Hàm tạo của lớp AppBarHome
  const AppBarHome(
    this._variableValue,
    this._variableValue2,
    this._opacity,
    this.itemList, {
    Key? key,
  }) : super(key: key);

  @override
  State<AppBarHome> createState() => _AppBarHomeState();
}

class _AppBarHomeState extends State<AppBarHome> {
  final CarouselController _pageController = CarouselController();
  late int currentPage = 0;

  // void autoNextPage(PageController pageController, List data) {
  //   Timer.periodic(const Duration(seconds: 5), (timer) {
  //     // Tăng currentPage
  //     if (currentPage < data.length - 1) {
  //       currentPage++;
  //     } else {
  //       currentPage = 0;
  //     }
  //
  //     // Chuyển đến trang mới
  //     pageController.animateToPage(
  //       currentPage,
  //       duration: const Duration(milliseconds: 500),
  //       curve: Curves.easeInOut,
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white.withOpacity(widget._opacity),
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      pinned: true,
      title: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: widget._opacity >= 1
              ? Color.fromRGBO(
                  widget._variableValue2.floor(),
                  widget._variableValue2.floor(),
                  widget._variableValue2.floor(),
                  0.2)
              : Colors.white,
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => SearchLocationPage(),
                settings: RouteSettings(
                  arguments: widget.itemList[currentPage].title,
                ),
              ),
            );
          },
          child: Row(
            children: [
              Container(
                height: 16,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                // child: Image.asset("assets/images/search_icon.png")),
                child: IconButton(
                  icon: const Icon(Icons.search, color: Colors.black),
                  onPressed: () {},
                ),
              ),
              Expanded(
                  child: Container(
                height: 40,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
                child: CarouselSlider(
                  carouselController: _pageController,
                  items: widget.itemList.map((i) {
                    return Container(
                        alignment: Alignment.centerLeft, child: Text(i.title));
                  }).toList(),
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentPage = index;
                      });
                    },
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 500),
                    autoPlayCurve: Curves.easeInOut,
                    scrollDirection: Axis.vertical,
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
      actions: [
        Container(
            height: 25,
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset(
              "assets/images/cart_icon.png",
              color: widget._opacity >= 1
                  ? Colors.black
                  : Color.fromRGBO(
                      widget._variableValue.floor(),
                      widget._variableValue.floor(),
                      widget._variableValue.floor(),
                      1),
            )),
      ],
    );
  }
}
