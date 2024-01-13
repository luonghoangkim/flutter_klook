import 'package:apptest/model/detail_model.dart';
import 'package:apptest/model/home_model.dart';
import 'package:apptest/model/hotel_model.dart';
import 'package:apptest/widgets/ServiceDetailItemList.dart';
import 'package:apptest/widgets/TietKiemCard.dart';
import 'package:apptest/widgets/animatted_Icon_Button.dart';
import 'package:apptest/widgets/app_color.dart';
import 'package:apptest/widgets/custom_button2.dart';
import 'package:apptest/widgets/custom_textbutton_hotel.dart';
import 'package:apptest/widgets/evalute_card_hotel.dart';
import 'package:apptest/widgets/icon_button_appbar.dart';
import 'package:apptest/widgets/linear_progress.dart';
import 'package:apptest/widgets/list_hotel_cart.dart';
import 'package:apptest/widgets/rating_hotel.dart';
import 'package:apptest/widgets/review_widget.dart';
import 'package:apptest/widgets/serviceItem_Card.dart';
import 'package:apptest/widgets/start_rating.dart';
import 'package:apptest/widgets/textWidthIcon.dart';
import 'package:apptest/widgets/text_bg_radius.dart';
import 'package:apptest/widgets/tility_tile.dart';
import 'package:apptest/widgets/title_detail_hotel.dart';
import 'package:apptest/widgets/tour_Card.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailBinhScreen extends StatefulWidget {
  const DetailBinhScreen({super.key});

  @override
  State<DetailBinhScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailBinhScreen>
    with SingleTickerProviderStateMixin {
  double _scrollPosition = 0;
  double scrollPoint = 182;
  late TabController tabController;
  int _currentImageIndex = 0;
  final GlobalKey _ServiceKey = GlobalKey();
  final GlobalKey _ReviewKey = GlobalKey();
  final GlobalKey _ServicePackKey = GlobalKey();
  final GlobalKey _QuestionKey = GlobalKey();
  final GlobalKey _LikeKey = GlobalKey();
  int visibleItemCount = 3;
  bottomState bottomBar = bottomState(true, false);
  final CarouselController _controller = CarouselController();
  late List<Map<String, String>> displayedItems;
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    displayedItems = DataDetail.ServiceData().take(visibleItemCount).toList();
    tabController = TabController(length: 5, vsync: this);
    _scrollController.addListener(() {
      setState(() {
        _scrollPosition = _scrollController.offset;
      });
    });
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
//   bool isWidgetVisible(GlobalKey key) {
//   final RenderObject? renderObject = key.currentContext?.findRenderObject();
//   if (renderObject != null && renderObject is RenderBox) {
//     final RenderBox box = renderObject;
//     final Offset offset = box.localToGlobal(Offset.zero);
//     final Rect bounds = offset & box.size;
//     return Rect.fromPoints(
//       Offset(0, 0),
//       Offset(MediaQuery.of(key.currentContext!).size.width, MediaQuery.of(key.currentContext!).size.height)
//     ).overlaps(bounds);
//   }
//   return false;
// }

  void _scrollToSection(int sectionIndex) {
    _scrollController.animateTo(
      sectionIndex * 500.0, // Replace 500.0 with the height of your sections
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _updateActiveSection(int sectionIndex) {
    setState(() {
      _activeSectionIndex = sectionIndex;
    });
  }

  void showMore() {
    setState(() {
      // Tăng số lượng item hiển thị
      visibleItemCount += 3;
      // Lấy danh sách các item cần hiển thị sau khi tăng số lượng
      displayedItems = DataDetail.ServiceData().take(visibleItemCount).toList();
    });
  }

  void updateBottomState(condition) {
    if (condition == 'hide') {
      setState(() {
        bottomBar.active = false;
      });
    } else if (condition == 'up') {
      setState(() {
        bottomBar.active = true;
        bottomBar.arrow = true;
      });
    } else if (condition == 'down') {
      setState(() {
        bottomBar.active = true;
        bottomBar.arrow = false;
      });
    } else if (condition == 'show') {
      setState(() {
        bottomBar.active = true;
      });
    }
  }

  void _scrollToSectionByKey(int index) {
    GlobalKey? key;
    switch (index) {
      case 0:
        key = _ServiceKey;
      case 1:
        key = _ReviewKey;
      case 2:
        key = _ServicePackKey;
      case 3:
        key = _QuestionKey;
      case 4:
        key = _LikeKey;
        break;
      // ... các trường hợp khác cho mỗi tab ...
    }
    if (key?.currentContext != null) {
      print('index ${key!.currentContext!}');
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: Duration(
            milliseconds: 300), // Thời gian chuyển động là 300 milliseconds
        curve: Curves.easeInOut,
      );
    }
  }

  int _activeSectionIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> dataWhyKlook = DataHotel.whyKlook();
    final List<Map<String, String>> dataFAQs = DataHotel.bookingFAQs();
    final List<Map<String, String>> DateData = DataDetail.DateData();
    final List<Map<String, String>> dataService = DataDetail.ServiceData();
    final List<Map<String, String>> dataTour = DataHome.TourData();
    final Object? arguments = ModalRoute.of(context)?.settings.arguments;
    final Map<String, dynamic>? argumentsMap =
        arguments as Map<String, dynamic>?;

    // }
    final String nameTitle = argumentsMap?['name'] as String? ??
        '[SALE] Vé Đài Quan Sát Landmark81 Skyview';
    final List<String> imageUrls = [
      'img/detailAppbar.webp',
      'img/detailAppBar1.webp',
      'img/detailAppBar2.webp',
      // Add more image URLs as needed
    ];
    return Scaffold(
      bottomNavigationBar: !bottomBar.active
          ? null
          : Container(
              height: 70,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      color: AppColors.textTitleColor,
                      width: 0.5), // Điều chỉnh độ rộng của đường viền tại đây
                ),
              ),
              child: BottomAppBar(
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Từ ',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: 'đ',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                TextSpan(
                                  text: ' 1,420,739',
                                  style: TextStyle(
                                    fontSize: 15,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('₫ 1,880,000',
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 12,
                                  color: AppColors.textTitleColor)),
                        ],
                      ),
                    ),
                    CustomButton(
                      text: 'Chọn',
                      icon: Icons
                          .keyboard_double_arrow_up, // Replace with your desired icon
                      onTap: () {
                        // Your tap callback
                        _scrollToSectionByKey(0);
                      },
                    )
                  ],
                ),
              ),
            ),
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        controller: _scrollController,
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            leading: Container(
              margin: const EdgeInsets.only(left: 5),
              child: IconButtonWidget(
                iconData: Icons.navigate_before,
                iconColor: Colors.black,
                onPressed: () {
                  Navigator.pop(context);
                },
                scrollPositionThreshold: 152.0,
                scrollPosition: _scrollPosition,
              ),
            ),
            actions: <Widget>[
              Row(
                children: [
                  AnimatedIconButton(
                      scrollPosition: _scrollPosition,
                      iconColor: Colors.orange,
                      boxColor: Colors.white,
                      iconData: Icons.message,
                      onPressed: () {
                        // Xử lý khi nhấn vào icon
                      },
                      scrollSize: 152),
                  AnimatedIconButton(
                      scrollPosition: _scrollPosition,
                      iconColor: Colors.orange,
                      boxColor: Colors.white,
                      iconData: Icons.favorite_outline,
                      onPressed: () {
                        // Xử lý khi nhấn vào icon
                      },
                      scrollSize: 152),
                  AnimatedIconButton(
                      scrollPosition: _scrollPosition,
                      iconColor: Colors.orange,
                      boxColor: Colors.white,
                      iconData: Icons.timer,
                      onPressed: () {
                        // Xử lý khi nhấn vào icon
                      },
                      scrollSize: 152),
                  AnimatedIconButton(
                      scrollPosition: _scrollPosition,
                      iconColor: Colors.orange,
                      boxColor: Colors.white,
                      iconData: Icons.card_giftcard,
                      onPressed: () {
                        // Xử lý khi nhấn vào icon
                      },
                      scrollSize: 152),
                ],
              )
            ],
            backgroundColor: _scrollPosition > 102
                ? Colors.white
                : Color.fromRGBO(0, 0, 0, 0.5),
            // backgroundColor: Colors.white,
            elevation: 0,
            floating: false,
            snap: false,
            pinned: true,

            centerTitle: false,
            stretch: true,
            expandedHeight: 300.0,

            bottom: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: Column(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    child: _scrollPosition > 178
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                flex: 5,
                                child: TabBar(
                                  isScrollable: true,
                                  labelColor: AppColors.primaryColor,
                                  indicatorColor: AppColors.primaryColor,
                                  dividerColor: Colors.transparent,
                                  unselectedLabelColor: Colors.black,
                                  controller: tabController,
                                  tabAlignment: TabAlignment.start,
                                  tabs: [
                                    'Các gói dịch vụ',
                                    'Đánh giá',
                                    'Về dịch vụ này',
                                    'Câu hỏi thường gặp',
                                    'Bạn có thể sẽ thích',
                                  ]
                                      .map((tabText) =>
                                          Tab(child: Text(tabText)))
                                      .toList(),
                                  onTap: (index) {
                                    // _scrollToSection(index);
                                    _scrollToSectionByKey(index);
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                flex: 1,
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 30,
                                  color: AppColors.textTitleColor,
                                ),
                              ),
                            ],
                          )
                        : null,
                  ),
                  Container(
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(26),
                          topRight: Radius.circular(26)),
                    ),
                    child: _scrollPosition > 152 ? null : Text(''),
                  ),
                ],
              ),
            ),

            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [StretchMode.zoomBackground],
              background: Stack(
                children: [
                  CarouselSlider(
                    carouselController: _controller,
                    items: imageUrls.map((url) {
                      return Image.asset(
                        url,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        // height: 300,
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: double.maxFinite,
                      viewportFraction: 1.0,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentImageIndex = index;
                        });
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 30.0,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imageUrls.asMap().entries.map((entry) {
                        int index = entry.key;
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                            width: 10.0,
                            height: 10.0,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentImageIndex == index
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Positioned(
                    bottom: 20.0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.matteBlack,
                          borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
                      margin: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.image, size: 20, color: Colors.white),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            'xem hinh anh',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                // ),
                Column(
                  children: [
                    Container(
                      width: double.maxFinite,
                      color: Colors.white,
                      padding: const EdgeInsets.all(1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.only(left: 14, right: 14),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              // color: Colors.yellow,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  // color: Colors.blue,
                                  alignment: Alignment.topLeft,
                                  margin:
                                      const EdgeInsets.only(top: 10, bottom: 2),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: AppColors.tourTagColor,
                                              borderRadius: BorderRadius.circular(
                                                  8.0), // Đặt giá trị border radius theo nhu cầu của bạn
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 1, horizontal: 8),
                                            child: Text(
                                              'Chính sách đảm bảo về giá',
                                              style: TextStyle(
                                                  color: Colors.orange,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.navigate_next,
                                                size: 35, color: Colors.orange),
                                            onPressed: () {},
                                          ),
                                        ],
                                      ),
                                      Text(
                                        nameTitle,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        'Sighteeing Double-Decker Bus Ticket by City Sightseeing',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.orange,
                                            size: 10,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              text: '4.8',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.orange,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: ' (477 Đánh giá)',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.grey[600],
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: '- 10K+ Đã được đặt',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          // Text('4.8 (3,654)'),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            // padding: const EdgeInsets.symmetric(
                                            //     vertical: 0, horizontal: 8),
                                            child: Row(
                                              children: [
                                                Icon(Icons.location_on,
                                                    size: 25,
                                                    color: Colors.black),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Nhà hát thành phố',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.navigate_next,
                                                size: 25, color: Colors.black),
                                            onPressed: () {},
                                          ),
                                        ],
                                      ),
                                      Stack(children: [
                                        Container(
                                          width: double.infinity,
                                          height: 150,
                                          alignment: Alignment.topCenter,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10),
                                          padding: EdgeInsets.only(
                                              left: 10, right: 100, top: 10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: AppColors.box),
                                          child: Row(children: [
                                            Text('•'),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Text(
                                                'Khám phá các điểm tham quan nổi tiếng của TP.Ho chi minh trong tour xe buyt 2 tấng như dinh độc lập',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ]),
                                        ),
                                        Positioned(
                                          bottom: 30,
                                          left: 0,
                                          right: 0,
                                          child: Column(
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  // color: AppColors.box,

                                                  gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      AppColors.box.withOpacity(
                                                          0.0), // Màu mờ đầu tiên (mờ hết)
                                                      AppColors
                                                          .box // Màu mờ cuối cùng (không mờ)
                                                    ],
                                                  ),
                                                ),
                                                child: Text(' '),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    // color: AppColors.box,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    color: AppColors.box),
                                                // color: Colors.red,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        // color: AppColors.box,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 1,
                                                          horizontal: 8),
                                                      child: Text("Xem thêm",
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              color: Colors
                                                                  .black)),
                                                    ),
                                                    Image.asset(
                                                      'img/Detail_page_like.png',
                                                      width: 50,
                                                      height: 50,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ]),
                                      VisibilityDetector(
                                        key: Key('hide'),
                                        onVisibilityChanged:
                                            (VisibilityInfo info) {
                                          double visiblePercentage =
                                              info.visibleFraction * 100;
                                          if (visiblePercentage >= 15) {
                                            // Kiểm tra nếu widget hiển thị 50%
                                            updateBottomState('hide');
                                          } else {
                                            // Widget không hiển thị trên cùng
                                            updateBottomState('show');
                                          }
                                        },
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  width: 7,
                                                  height: 22,
                                                  decoration: BoxDecoration(
                                                      // color: AppColors.box,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color: AppColors
                                                          .primaryColor),
                                                  child: Text(' '),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  // width: 350,
                                                  // color: Colors.green,
                                                  key: _ServiceKey,
                                                  child: Text(
                                                    'Các gói dịch vụ',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: DateData.map((item) {
                                                  return InkWell(
                                                    onTap: () {},
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.all(
                                                              4),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        border: Border.all(
                                                          color: Colors
                                                              .black, // Màu của đường viền
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(18),
                                                      ),
                                                      padding: const EdgeInsets
                                                          .fromLTRB(
                                                          14, 8, 14, 8),
                                                      child: IntrinsicWidth(
                                                        child: Text(
                                                          item['title']!,
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                            Column(
                                              children:
                                                  List.generate(4, (index) {
                                                return Container(
                                                  width: double.infinity,
                                                  // color: Colors.red,
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 20),
                                                  child: Column(children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          // color: Colors.green,
                                                          child: Flexible(
                                                            flex: 4,
                                                            child: Text(
                                                              '[Vé Ngày] Vé 24 giơ + Vé Tham quan Bảo tàng Chứng tích Chiến Tranh +DinhĐộc lập',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          flex: 1,
                                                          child: Text(
                                                            'Chi tiết >',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              color:
                                                                  Colors.blue,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        children: List.generate(
                                                            6, (indexChild) {
                                                          return InkWell(
                                                            onTap: () {},
                                                            child: Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .all(4),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: AppColors
                                                                    .listTitleColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      8,
                                                                      2,
                                                                      8,
                                                                      2),
                                                              child:
                                                                  IntrinsicWidth(
                                                                child: Text(
                                                                  'Xác nhận tức thời',
                                                                  style:
                                                                      const TextStyle(
                                                                    color: AppColors
                                                                        .textTitleColor,
                                                                    fontSize:
                                                                        12,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                      ),
                                                    ),
                                                    ServiceItemList(
                                                      dataService: dataService,
                                                    ),
                                                  ]),
                                                );
                                              }),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        // color: Colors.green,
                                        child: Text(
                                          'Tiết kiệm hon khi đi du lịch TP Hồ Chí Minh',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      VisibilityDetector(
                                          key: Key('ServiceKey'),
                                          onVisibilityChanged:
                                              (VisibilityInfo info) {
                                            double visiblePercentage =
                                                info.visibleFraction * 100;
                                            if (visiblePercentage >= 80) {
                                              // Kiểm tra nếu widget hiển thị 100%
                                              tabController.animateTo(0,
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  curve: Curves.easeInOut);
                                            } else {
                                              // Widget không hiển thị trên cùng
                                            }
                                          },
                                          child: Container(
                                              width: double.infinity,
                                              child: TietKiemCard())),
                                    ],
                                  ),
                                ),
//danh gia
                                SizedBox(
                                  height: 15,
                                ),
                                VisibilityDetector(
                                  key: _ReviewKey,
                                  onVisibilityChanged: (VisibilityInfo info) {
                                    // RenderBox renderBox =
                                    //     context.findRenderObject() as RenderBox;
                                    // Offset offset = renderBox.localToGlobal(
                                    //     Offset.zero,
                                    //     ancestor: context.findRenderObject());

                                    // print('Offset: $offset');
                                    double visiblePercentage =
                                        info.visibleFraction * 100;
                                    if (visiblePercentage > 80) {
                                      tabController.animateTo(1,
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.easeInOut);
                                    } else {
                                      // Widget không hiển thị trên màn hình
                                    }
                                  },

                                  child: Container(
                                    // key: _ReviewKey,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: 7,
                                              height: 22,
                                              decoration: BoxDecoration(
                                                  // color: AppColors.box,

                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color:
                                                      AppColors.primaryColor),
                                              child: Text(' '),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              // width: 350,
                                              // color: Colors.green,

                                              child: Text(
                                                'Đánh giá',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        ReviewWidget(
                                            rating: 4.5,
                                            reviewCount: 3,
                                            reviewerName: 'Lâm',
                                            reviewDate: '9/8/2023',
                                            reviewContent:
                                                'Xe chở một vòng ngắm nhìn thành phố , mới thấy thành phố xinh...')
                                      ],
                                    ),
                                  ), // Widget của bạn
                                ),

                                SizedBox(
                                  height: 35,
                                ),
                                VisibilityDetector(
                                  key: _ServicePackKey,
                                  onVisibilityChanged: (VisibilityInfo info) {
                                    double visiblePercentage =
                                        info.visibleFraction * 100;
                                    if (visiblePercentage >= 40) {
                                      // Kiểm tra nếu widget hiển thị 100%
                                      tabController.animateTo(2,
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.easeInOut);
                                    } else {
                                      // Widget không hiển thị trên cùng
                                    }
                                  },
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 7,
                                              height: 22,
                                              decoration: BoxDecoration(
                                                  // color: AppColors.box,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color:
                                                      AppColors.primaryColor),
                                              child: Text(' '),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              // width: 350,
                                              // color: Colors.green,

                                              child: Text(
                                                'Về dịch vụ này',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          width: double.infinity,
                                          // color: Colors.green,
                                          child: Text(
                                            'Vì sao bạn nên chọn tham quan Sài Gòn trên xe buýt hai tầng',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          // color: Colors.green,
                                          child: Text(
                                            'Bắt đầu chuyến phiêu lưu tìm hiểu về di tích lịch sử Địa Đạo Củ Chi và đồng bằng sông Cửu Long từ Hồ Chí Minh! Khám phá hệ thống đường hầm bí mật của Địa Đạo Củ Chi và hiểu rõ hơn cách quân dân ta sống sót dưới những điều kiện khắc nghiệt của chiến tranh. Trải nghiệm một vài mạng lưới ngầm của Địa Đạo Củ Chi để có những cảm xúc chân thật nhất về cuộc sống thời chiến.Tìm hiểu về lịch sử đất nước trong những năm tháng chiến tranh hào hùng và câu chuyện đằng sau mạng lưới đường hầm phức tạp tại Củ Chi. Ghé thăm thành phố Mỹ Tho và đi xe đạp dạo quanh làng để gặp gỡ và trò chuyện với người dân.',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: Image.network(
                                                'https://res.klook.com/image/upload/fl_lossy.progressive,q_auto/w_136,h_136,c_fill/c_fill,w_420,h_260/activities/oklw8nrqcrhpxz2bjbpv.webp',
                                                height: 200.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.info,
                                                      color: AppColors
                                                          .textTitleColor,
                                                      size: 10,
                                                    ),
                                                    SizedBox(width: 8.0),
                                                    Flexible(
                                                      child: Text(
                                                        'Bắt đầu chuyến phiêu lưu tìm hiểu về di tích lịch sử Địa Đạo Củ Chi và đồng bằng sông Cửu Long ',
                                                        style: TextStyle(
                                                          fontSize: 12.0,
                                                          color: AppColors
                                                              .textTitleColor,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: Image.network(
                                                'https://res.klook.com/image/upload/fl_lossy.progressive,q_auto/w_136,h_136,c_fill/c_fill,w_420,h_260/activities/oklw8nrqcrhpxz2bjbpv.webp',
                                                height: 200.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.info,
                                                    color: AppColors
                                                        .textTitleColor,
                                                    size:
                                                        10, // Đặt màu của biểu tượng tùy ý
                                                  ),
                                                  SizedBox(width: 8.0),
                                                  Text(
                                                    'Your Caption Here',
                                                    style: TextStyle(
                                                        fontSize: 12.0,
                                                        color: AppColors
                                                            .textTitleColor),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: 15,
                                ),

                                SizedBox(
                                  height: 15,
                                ),

                                VisibilityDetector(
                                  key: _QuestionKey,
                                  onVisibilityChanged: (VisibilityInfo info) {
                                    double visiblePercentage =
                                        info.visibleFraction * 100;
                                    if (visiblePercentage == 100) {
                                      // Kiểm tra nếu widget hiển thị 100%
                                      tabController.animateTo(3,
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.easeInOut);
                                    } else {
                                      // Widget không hiển thị trên cùng
                                    }
                                  },
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 7,
                                              height: 22,
                                              decoration: BoxDecoration(
                                                  // color: AppColors.box,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color:
                                                      AppColors.primaryColor),
                                              child: Text(' '),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              // width: 350,
                                              // color: Colors.green,
                                              child: Text(
                                                'Câu hỏi thường gặp',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Center(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                border: Border.all(
                                                    color: AppColors
                                                        .listTitleColor,
                                                    width: 0.5)),
                                            child: ListTile(
                                              title: Text('Hỗ trợ khách hàng'),
                                              trailing:
                                                  Icon(Icons.arrow_forward_ios),
                                              onTap: () {
                                                // Handle the tap event here
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 7,
                                      height: 22,
                                      decoration: BoxDecoration(
                                          // color: AppColors.box,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: AppColors.primaryColor),
                                      child: Text(' '),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      // width: 350,
                                      // color: Colors.green,
                                      key: _LikeKey,
                                      child: Text(
                                        'Bạn có thể sẽ thích',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: dataTour.map((item) {
                                      return Row(
                                        children: [
                                          TourCard(
                                            title: item['title']!,
                                            imageUrl: item['img']!,
                                          ),
                                          SizedBox(
                                              width:
                                                  16), // Khoảng cách giữa các phần tử
                                        ],
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final List<Map<String, dynamic>> evaluteCardData = [
  {
    'customerName': 'Felecia',
    'date': '27/7/2023',
    'rating': 5.0,
    'category': 'Gia đình - vui chơi',
    'reviewContent':
        'Excellent hotel- amenities,  breakfast buffet,  massage,  majority of the staff.  Unfortunately,  I  encountered a horrible experience at the Chinese restaurant inside the hotel. The staff at that particular restaurant was rude, inconsiderate and unprofessional. However, overall this hotel is definitely a 5 star and the staff is 4 star due to my encounter at the Chinese restaurant.',
  },
  {
    'customerName': 'John Doe',
    'date': '28/7/2023',
    'rating': 4.5,
    'category': 'Business Trip',
    'reviewContent':
        'Great stay, excellent service. The staff was very helpful and the facilities were top-notch. Highly recommend for business travelers.',
  },
  {
    'customerName': 'Alice',
    'date': '29/7/2023',
    'rating': 4.8,
    'category': 'Solo Travel',
    'reviewContent':
        'Had a wonderful solo trip. The location was perfect, and the amenities provided by the hotel were outstanding. Will definitely come back.',
  },
  {
    'customerName': 'Bob',
    'date': '30/7/2023',
    'rating': 3.5,
    'category': 'Adventure',
    'reviewContent':
        'The hotel was okay, but there were a few issues with cleanliness. The staff was friendly, and the surrounding area had good places to explore.',
  },
  {
    'customerName': 'Eva',
    'date': '31/7/2023',
    'rating': 4.2,
    'category': 'Family Vacation',
    'reviewContent':
        'Enjoyed a family vacation at this hotel. The atmosphere was pleasant, and the staff took good care of us. However, the rooms could use some improvement.',
  },
];
final List<String> imageUrls = [
  'img/img_hotel1.jpeg',
  'img/img_hotel2.jpeg',
  'img/img_hotel3.jpeg',
  'img/img_hotel4.jpeg',
  'img/img_hotel5.jpeg',
];
final List<Map<String, String>> locations = [
  {'name': 'Chùa Vĩnh Nghiêm', 'distance': '400m'},
  {
    'name': 'Đại học Sư phạm Thành phố Hồ Chí Minh- Cơ sở 2',
    'distance': '600m'
  },
  {'name': 'Chợ Tân Định', 'distance': '500m'},
];
final List<Map<String, dynamic>> tilities = [
  {'id': '1', 'item': 'Wifi miễn phí', 'icon': Icons.wifi},
  {'id': '2', 'item': 'Trung tâm thể hình', 'icon': Icons.fitness_center},
  {
    'id': '3',
    'item': 'Đón và trả khách trạm tàu hoà/xe buuýt, sân bay(có phụ phí)',
    'icon': Icons.airport_shuttle,
  },
];
final List<Map<String, dynamic>> infrastructure = [
  {'id': '1', 'item': 'Bãi đỗ xe', 'icon': Icons.check_circle_outline},
  {
    'id': '2',
    'item': 'Khu vực hút thuốc được chỉ định',
    'icon': Icons.check_circle_outline
  },
  {
    'id': '3',
    'item': 'Thang máy',
    'icon': Icons.check_circle_outline,
  },
  {
    'id': '4',
    'item': 'Dịch vụ cưới',
    'icon': Icons.check_circle_outline,
  },
  {
    'id': '5',
    'item': 'Trung tâm thương mại',
    'icon': Icons.check_circle_outline,
  },
];
final List<Map<String, dynamic>> dataCustomNearbyPlaceCard = [
  {
    'imagePath': 'img/img_hotel1.jpeg',
    'hotelName': 'Khách sạn hoa công 1',
    'rating': 4.0,
    'ratingStatus': '4.7/5',
    'price': '\$80',
  },
  {
    'imagePath': 'img/img_hotel2.jpeg',
    'hotelName': 'Khách sạn hoa công 2',
    'rating': 3.5,
    'ratingStatus': '3.5/5',
    'price': '\$65',
  },
  {
    'imagePath': 'img/img_hotel3.jpeg',
    'hotelName': 'Khách sạn hoa công 3',
    'rating': 4.2,
    'ratingStatus': '4.2/5',
    'price': '\$90',
  },
  {
    'imagePath': 'img/img_hotel4.jpeg',
    'hotelName': 'Khách sạn hoa công 4',
    'rating': 4.8,
    'ratingStatus': '4.8/5',
    'price': '\$120',
  },
  {
    'imagePath': 'img/img_hotel5.jpeg',
    'hotelName': 'Khách sạn hoa công 5',
    'rating': 3.9,
    'ratingStatus': '3.9/5',
    'price': '\$75',
  },
];
