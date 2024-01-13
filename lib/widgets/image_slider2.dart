import 'dart:async';
import 'package:apptest/widgets/carousel_Card.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  final List<Map<String, String>> Data;

  ImageSlider({Key? key, required this.Data}) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });

    // Tự động cuộn PageView sau một khoảng thời gian cố định (ví dụ: mỗi 3 giây)
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      
      if (_currentPage < widget.Data.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        PageView.builder(
          controller: _pageController,
          itemCount: widget.Data.length,
          itemBuilder: (context, index) {
            return CarouselCard(
                imageUrl: widget.Data[index]['img']!,
                title: widget.Data[index]['title']!,
                index: _currentPage + 1);
            // return Text('hahah');
          },
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: 30,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
              ),
              color: Color.fromRGBO(0, 0, 0, 0.7),
            ),
            child: Row(
              children: [
                const SizedBox(width: 5),
                RichText(
                  text: TextSpan(
                    text: (_currentPage + 1).toString(),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                    children: [
                      TextSpan(
                        text: '/',
                        style: TextStyle(
                          fontSize: 12,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: widget.Data.length.toString(),
                        style: TextStyle(
                          fontSize: 12,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(color: Colors.white),
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: const Icon(
              Icons.favorite_border,
            ),
            color: Colors.white,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
