import 'package:apptest/model/home_model.dart';
import 'package:apptest/widgets/app_color.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class custon_searchBox extends StatelessWidget {
  final String title;
  final String subtitle;
  final CarouselController _Searchcontroller = CarouselController();
  final List<Map<String, String>> dataSearch = DataHome.SearchData();
  custon_searchBox({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35.0),
      ),
      // child: Row(
      //   children: [
      //     IconButton(
      //       icon: const Icon(Icons.search, color: Colors.black),
      //       onPressed: () {},
      //     ),
      //     const SizedBox(width: 15),
      //     // Text(title,
      //     //     style: const TextStyle(color: Colors.black, fontSize: 18)),
      //     CarouselSlider(
      //       carouselController: _controller,
      //       items: dataSearch.map((item) {
      //         return Text(item['title']!,
      //             style: const TextStyle(color: Colors.black, fontSize: 15));
      //       }).toList(),
      //       options: CarouselOptions(
      //         height: double.maxFinite,
      //         viewportFraction: 1.0,
      //         enableInfiniteScroll: true,
      //         autoPlay: true,

      //       ),
      //     ),
      //   ],
      // ),
      child: Row(
        children: [
          Container(
            // height: 16,
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
              carouselController: _Searchcontroller,
              items: dataSearch.map((item) {
                return Text(item['title']!,
                    style: const TextStyle(color: Colors.black, fontSize: 15));
              }).toList(),
              options: CarouselOptions(
                // onPageChanged: (index, reason) {
                //   setState(() {
                //     currentPage = index;
                //   });
                // },
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 500),
                autoPlayCurve: Curves.easeInOut,
                scrollDirection: Axis.vertical,
              ),
            ),
          ))
        ],
      ),
    );
  }
}
