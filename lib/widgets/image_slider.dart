import 'package:apptest/widgets/app_color.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  final List<String> imageUrls;

  ImageSlider({Key? key, required this.imageUrls}) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        PageView.builder(
          controller: _pageController,
          itemCount: widget.imageUrls.length,
          itemBuilder: (context, index) {
            return Image.asset(
              widget.imageUrls[index],
              fit: BoxFit.cover,
            );
          },
        ),
        Container(
          decoration: BoxDecoration(
              color: AppColors.matteBlack,
              borderRadius: BorderRadius.circular(16)),
          padding: const EdgeInsets.fromLTRB(10,4,10,4),
          margin: const EdgeInsets.all(8.0),
          child: Text(
            '${_currentPage + 1}/${widget.imageUrls.length}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: const Icon(Icons.favorite_border,),
            color: Colors.white,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
