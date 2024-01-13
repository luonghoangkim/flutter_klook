import 'package:apptest/model/home_model.dart';
import 'package:apptest/screens/nav_screens/search_location_page.dart';
import 'package:apptest/widgets/carousel_Card.dart';
import 'package:apptest/widgets/custom_utill.dart';
import 'package:apptest/widgets/explore_Card.dart';
import 'package:apptest/widgets/horizontal_ListWidget.dart';
import 'package:apptest/widgets/button_rep%C3%B3nive.dart';
import 'package:apptest/widgets/custon_searchBox.dart';
import 'package:apptest/widgets/image_slider2.dart';
import 'package:apptest/widgets/recent_card.dart';
import 'package:apptest/widgets/sale_Card%20.dart';
import 'package:apptest/widgets/search.dart';
import 'package:apptest/widgets/tour_Card.dart';
import 'package:apptest/widgets/travel_Card.dart';
import 'package:flutter/material.dart';
import 'package:apptest/model/hotel_model.dart';
import 'package:apptest/widgets/app_color.dart';
import 'package:apptest/widgets/custon_card_listtile.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter_sticky_widgets/flutter_sticky_widgets.dart';

class HomePageNew extends StatefulWidget {
  const HomePageNew({Key? key}) : super(key: key);

  @override
  State<HomePageNew> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageNew>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  double _variableValue = 255;
  bool isLoading = true;
  double _opacity = 0;
  final List<Map<String, String>> dataAttractions = DataHome.attractions();
  double _variableValue2 = 0;
  late final ScrollController _scrollController;
  double _scrollPosition = 0.0;
  RxString city = ''.obs;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    tabController = TabController(length: 5, vsync: this);
    _scrollController.addListener(_listener);
  }

  void _listener() {
    final offset = _scrollController.offset;
    setState(() {
      isLoading = false;
      _opacity = (offset / 50);
      if (_opacity > 1) _opacity = 1;
      _variableValue = (1 - _opacity) * 255;
      _variableValue2 = _opacity * 188;
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        isLoading = true;
        fetch();
      }
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void fetch() async {
    // await Future.delayed(Duration(seconds: 3));
    dataAttractions.add({
      "name": "Công viên văn hóa đầm sen ",
      "imageUrl": "img/detailAppBar2.webp",
      "distance": '4.4',
      "price": '150000'
    });
  }

  void _navigateToSearchPage(BuildContext context) async {
    final result = await Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return SearchLocationPage();
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
    if (result != null && result is Map<String, String>) {
      setState(() {
        city.value = result['name']!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> dataUtili = DataHome.utililData();
    final List<Map<String, String>> dataRecent = DataHome.recentData();
    final List<Map<String, String>> dataWhyKlook = DataHotel.whyKlook();
    final List<Map<String, String>> dataFAQs = DataHotel.bookingFAQs();
    final List<Map<String, String>> dataCarousel = DataHome.CarouselData();
    final List<Map<String, String>> dataTravel = DataHome.TravelData();
    final List<Map<String, String>> dataTour = DataHome.TourData();

    final List<Map<String, String>> dataSearch = DataHome.SearchData();
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            snap: false,
            pinned: true,
            backgroundColor: _scrollPosition > 50
                ? Colors.white
                : Color(0xFFFF5B00), // Đặt màu trong suốt cho AppBar
            elevation: 0, // Loại bỏ đường viền của AppBar

            title: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  // child: custon_searchBox(
                  //     title: 'tokyo', subtitle: 'subtitle')
                  child: InkWell(
                    onTap: () {
                      _navigateToSearchPage(context);
                    },

                    // }),
                    child: Obx(() {
                      return custon_searchBox(
                          title: city.isNotEmpty
                              ? '$city'
                              : 'Thành phố HCM, Việt Nam',
                          subtitle: 'subtitle');
                    }),
                    // child: custon_searchBox(
                    //     title: 'tokyo', subtitle: 'subtitle'),
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                color: _scrollPosition > 101 ? Colors.black : Colors.white,
                onPressed: () {
                  // Hành động khi nút được nhấn
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 250,
                        // decoration: const BoxDecoration(
                        //   image: DecorationImage(
                        //     image: AssetImage("img/banner_hotel.jpeg"),
                        //     fit: BoxFit.cover,
                        //   ),
                        // ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFFF5B00),
                              Color(0xFFFF5B00),
                              Color(0x00FF5B00),
                              Color(0x00FF5B00),
                            ],
                            stops: [0.0, 0.5257, 0.95, 1.0],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.all(16),
                          margin: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(14),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color.fromARGB(
                                              255, 109, 109, 109)
                                          .withOpacity(0.2),
                                      spreadRadius: 5,
                                      blurRadius: 10,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height:
                                          120, // Đặt chiều cao cố định cho Row
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              color: Colors.white,
                                              child: Column(
                                                // mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Image.asset('img/tour.webp',
                                                      width: 44, height: 55),
                                                  Text('Tour & trải nghiệm',
                                                      textAlign:
                                                          TextAlign.center),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              color: Colors.white,
                                              child: Column(
                                                // mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Image.asset('img/ticket.webp',
                                                      width: 44, height: 55),
                                                  Text('vé đi tham quan',
                                                      textAlign:
                                                          TextAlign.center),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              color: Colors.white,
                                              child: Column(
                                                // mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Image.asset('img/hotel.webp',
                                                      width: 44, height: 55),
                                                  Text('Khách sạn',
                                                      textAlign:
                                                          TextAlign.center),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              color: Colors.white,
                                              child: Column(
                                                // mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Image.asset('img/move.webp',
                                                      width: 44, height: 54),
                                                  Text('Di chuyển',
                                                      textAlign:
                                                          TextAlign.center),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              color: Colors.white,
                                              child: Column(
                                                // mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                      'img/driving_car.webp',
                                                      width: 44,
                                                      height: 54),
                                                  Text('Thuê xe tự lái',
                                                      textAlign:
                                                          TextAlign.center),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: AppColors.listTitleColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: TextButton(
                                        style: ButtonStyle(
                                          foregroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.black),
                                        ),
                                        onPressed: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'img/categories.png',
                                              width: 20,
                                              height: 20,
                                            ),
                                            const SizedBox(
                                                width:
                                                    8), // Add some spacing between icon and text
                                            const Text(
                                              'Tất cả các mục',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: dataUtili.map((item) {
                                    return Row(
                                      children: [
                                        CustomUtillItem(
                                          imageAsset: item['img']!,
                                          title: item["title"]!,
                                        ),
                                        SizedBox(
                                            width:
                                                16), // Khoảng cách giữa các phần tử
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 32, bottom: 2),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Xem gần đây ",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black)),
                                    Text("Xem thêm",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black)),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: dataRecent.map((item) {
                                    return Row(
                                      children: [
                                        RecentCard(
                                          title: item["title"]!,
                                          price: item["price"]!,
                                          imageUrl: item['img']!,
                                          img: '',
                                        ),
                                        SizedBox(
                                            width:
                                                16), // Khoảng cách giữa các phần tử
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 2, bottom: 2),
                                child: const Text("ƯU ĐÃI DU LỊCH HẤP DẪN",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black)),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(children: [
                                  Container(
                                    width: 200,
                                    height: 200,
                                    child: Stack(
                                      children: [
                                        ImageSlider(Data: dataCarousel)
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 200,
                                    height: 200,
                                    child: SaleCard(),
                                  ),
                                ]),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 32, bottom: 2),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Bạn muốn đi đâu chơi",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black)),
                                    Text("Xem thêm",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black)),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: dataTravel.map((item) {
                                    return Row(
                                      children: [
                                        TravelCard(
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
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 32, bottom: 2),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Các hoạt đông nổi bậc",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black)),
                                    Text("Xem thêm",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black)),
                                  ],
                                ),
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
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 2, bottom: 2),
                                child: const Text("Khám phá thêm",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black)),
                              ),
                              Container(
                                child: Column(
                                  children: [],
                                ),
                              ),

                              // Container(
                              //   height:
                              //       (dataAttractions.length / 2).round() * 290,
                              //   child: Column(
                              //     children: [
                              //       Flexible(
                              //         child: TabBarView(
                              //           controller: tabController,
                              //           children: [
                              //             Container(
                              //               width: double
                              //                   .infinity, // Đặt chiều rộng của Container là không giới hạn

                              //               // Đặt chiều cao của Container
                              //               child: GridView(
                              //                 shrinkWrap: true,
                              //                 physics:
                              //                     NeverScrollableScrollPhysics(),
                              //                 gridDelegate:
                              //                     SliverGridDelegateWithFixedCrossAxisCount(
                              //                         crossAxisCount:
                              //                             2, // Số cột
                              //                         mainAxisExtent: 240,
                              //                         childAspectRatio: 3 / 4,
                              //                         crossAxisSpacing: 30,
                              //                         mainAxisSpacing: 20),
                              //                 children:
                              //                     dataAttractions.map((item) {
                              //                   return InkWell(
                              //                     onTap: () {
                              //                       Navigator.pushNamed(context,
                              //                           '/detailScreen');
                              //                     },
                              //                     child: ExploreCard(
                              //                         name: item['name']!,
                              //                         imageUrl:
                              //                             item['imageUrl']!,
                              //                         distance:
                              //                             item['distance']!,
                              //                         price: item['price']!),
                              //                   );
                              //                 }).toList(),
                              //               ),
                              //             ),

                              //             // Content for Tab 2
                              //             Center(
                              //               child: Container(
                              //                 color: Colors.white,
                              //                 child: GridView(
                              //                   shrinkWrap: true,
                              //                   gridDelegate:
                              //                       SliverGridDelegateWithFixedCrossAxisCount(
                              //                     crossAxisCount:
                              //                         2, // Number of columns
                              //                     mainAxisExtent: 240,
                              //                     childAspectRatio: 3 / 4,
                              //                     crossAxisSpacing: 30,
                              //                   ),
                              //                   children:
                              //                       dataAttractions.map((item) {
                              //                     return InkWell(
                              //                       onTap: () {
                              //                         Navigator.pushNamed(
                              //                             context,
                              //                             '/detailScreen');
                              //                       },
                              //                       child: ExploreCard(
                              //                           name: item['name']!,
                              //                           imageUrl:
                              //                               item['imageUrl']!,
                              //                           distance:
                              //                               item['distance']!,
                              //                           price: item['price']!),
                              //                     );
                              //                   }).toList(),
                              //                 ),
                              //               ),
                              //             ),
                              //             Center(
                              //               child: Container(
                              //                 color: Colors.white,
                              //                 child: GridView(
                              //                   shrinkWrap: true,
                              //                   gridDelegate:
                              //                       SliverGridDelegateWithFixedCrossAxisCount(
                              //                     crossAxisCount:
                              //                         2, // Number of columns
                              //                     mainAxisExtent: 240,
                              //                     childAspectRatio: 3 / 4,
                              //                     crossAxisSpacing: 30,
                              //                   ),
                              //                   children:
                              //                       dataAttractions.map((item) {
                              //                     return InkWell(
                              //                       onTap: () {
                              //                         Navigator.pushNamed(
                              //                             context,
                              //                             '/detailScreen');
                              //                       },
                              //                       child: ExploreCard(
                              //                           name: item['name']!,
                              //                           imageUrl:
                              //                               item['imageUrl']!,
                              //                           distance:
                              //                               item['distance']!,
                              //                           price: item['price']!),
                              //                     );
                              //                   }).toList(),
                              //                 ),
                              //               ),
                              //             ),

                              //             // Content for Tab 2
                              //             Center(
                              //               child: Container(
                              //                 color: Colors.white,
                              //                 child: GridView(
                              //                   shrinkWrap: true,
                              //                   gridDelegate:
                              //                       SliverGridDelegateWithFixedCrossAxisCount(
                              //                     crossAxisCount:
                              //                         2, // Number of columns
                              //                     mainAxisExtent: 240,
                              //                     childAspectRatio: 3 / 4,
                              //                     crossAxisSpacing: 30,
                              //                   ),
                              //                   children:
                              //                       dataAttractions.map((item) {
                              //                     return InkWell(
                              //                       onTap: () {
                              //                         Navigator.pushNamed(
                              //                             context,
                              //                             '/detailScreen');
                              //                       },
                              //                       child: ExploreCard(
                              //                           name: item['name']!,
                              //                           imageUrl:
                              //                               item['imageUrl']!,
                              //                           distance:
                              //                               item['distance']!,
                              //                           price: item['price']!),
                              //                     );
                              //                   }).toList(),
                              //                 ),
                              //               ),
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),

                              // ListView.builder(
                              //   physics: NeverScrollableScrollPhysics(),
                              //   itemCount: 10,
                              //   shrinkWrap: true,
                              //   itemBuilder: (context, index) => Text('$index hah'),
                              // )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            floating: false,
            delegate: _SliverAppBarDelegate(
              minHeight: 60.0,
              maxHeight: 60.0,
              child: Container(
                // height: 50,
                // width: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(1),
                      child: TabBar(
                        isScrollable: true,
                        labelColor: AppColors.primaryColor,
                        indicatorColor: AppColors.primaryColor,
                        dividerColor: Colors.transparent,
                        unselectedLabelColor: Colors.black,
                        controller: tabController,
                        tabAlignment: TabAlignment.start,
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
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: (dataAttractions.length / 2).round() * 220,
              child: Column(
                children: [
                  Flexible(
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        // ListView.builder(
                        //   itemCount: 6,
                        //   itemBuilder: (context, index) {
                        //     return
                        //   },
                        // ),

                        Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:
                                      (dataAttractions.length / 2).ceil(),
                                  itemBuilder: (context, index) {
                                    int dataIndex = index * 2;

                                    return InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          '/detailScreen',
                                          arguments: {
                                            'name': dataAttractions[dataIndex]
                                                ['name']!
                                          },
                                        );
                                      },
                                      child: ExploreCard(
                                        name: dataAttractions[dataIndex]
                                            ['name']!,
                                        imageUrl: dataAttractions[dataIndex]
                                            ['imageUrl']!,
                                        distance: dataAttractions[dataIndex]
                                            ['distance']!,
                                        price: dataAttractions[dataIndex]
                                            ['price']!,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:
                                      (dataAttractions.length / 2).floor(),
                                  itemBuilder: (context, index) {
                                    int dataIndex = index * 2 + 1;

                                    return InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          '/detailScreen',
                                          arguments: {
                                            'name': dataAttractions[dataIndex]
                                                ['name']!
                                          },
                                        );
                                      },
                                      child: ExploreCard(
                                        name: dataAttractions[dataIndex]
                                            ['name']!,
                                        imageUrl: dataAttractions[dataIndex]
                                            ['imageUrl']!,
                                        distance: dataAttractions[dataIndex]
                                            ['distance']!,
                                        price: dataAttractions[dataIndex]
                                            ['price']!,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:
                                      (dataAttractions.length / 2).ceil(),
                                  itemBuilder: (context, index) {
                                    int dataIndex = index * 2;

                                    return InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          '/detailScreen',
                                          arguments: {
                                            'name': dataAttractions[dataIndex]
                                                ['name']!
                                          },
                                        );
                                      },
                                      child: ExploreCard(
                                        name: dataAttractions[dataIndex]
                                            ['name']!,
                                        imageUrl: dataAttractions[dataIndex]
                                            ['imageUrl']!,
                                        distance: dataAttractions[dataIndex]
                                            ['distance']!,
                                        price: dataAttractions[dataIndex]
                                            ['price']!,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:
                                      (dataAttractions.length / 2).floor(),
                                  itemBuilder: (context, index) {
                                    int dataIndex = index * 2 + 1;

                                    return InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          '/detailScreen',
                                          arguments: {
                                            'name': dataAttractions[dataIndex]
                                                ['name']!
                                          },
                                        );
                                      },
                                      child: ExploreCard(
                                        name: dataAttractions[dataIndex]
                                            ['name']!,
                                        imageUrl: dataAttractions[dataIndex]
                                            ['imageUrl']!,
                                        distance: dataAttractions[dataIndex]
                                            ['distance']!,
                                        price: dataAttractions[dataIndex]
                                            ['price']!,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:
                                      (dataAttractions.length / 2).ceil(),
                                  itemBuilder: (context, index) {
                                    int dataIndex = index * 2;

                                    return InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          '/detailScreen',
                                          arguments: {
                                            'name': dataAttractions[dataIndex]
                                                ['name']!
                                          },
                                        );
                                      },
                                      child: ExploreCard(
                                        name: dataAttractions[dataIndex]
                                            ['name']!,
                                        imageUrl: dataAttractions[dataIndex]
                                            ['imageUrl']!,
                                        distance: dataAttractions[dataIndex]
                                            ['distance']!,
                                        price: dataAttractions[dataIndex]
                                            ['price']!,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:
                                      (dataAttractions.length / 2).floor(),
                                  itemBuilder: (context, index) {
                                    int dataIndex = index * 2 + 1;

                                    return InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          '/detailScreen',
                                          arguments: {
                                            'name': dataAttractions[dataIndex]
                                                ['name']!
                                          },
                                        );
                                      },
                                      child: ExploreCard(
                                        name: dataAttractions[dataIndex]
                                            ['name']!,
                                        imageUrl: dataAttractions[dataIndex]
                                            ['imageUrl']!,
                                        distance: dataAttractions[dataIndex]
                                            ['distance']!,
                                        price: dataAttractions[dataIndex]
                                            ['price']!,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:
                                      (dataAttractions.length / 2).ceil(),
                                  itemBuilder: (context, index) {
                                    int dataIndex = index * 2;

                                    return InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          '/detailScreen',
                                          arguments: {
                                            'name': dataAttractions[dataIndex]
                                                ['name']!
                                          },
                                        );
                                      },
                                      child: ExploreCard(
                                        name: dataAttractions[dataIndex]
                                            ['name']!,
                                        imageUrl: dataAttractions[dataIndex]
                                            ['imageUrl']!,
                                        distance: dataAttractions[dataIndex]
                                            ['distance']!,
                                        price: dataAttractions[dataIndex]
                                            ['price']!,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:
                                      (dataAttractions.length / 2).floor(),
                                  itemBuilder: (context, index) {
                                    int dataIndex = index * 2 + 1;

                                    return InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          '/detailScreen',
                                          arguments: {
                                            'name': dataAttractions[dataIndex]
                                                ['name']!
                                          },
                                        );
                                      },
                                      child: ExploreCard(
                                        name: dataAttractions[dataIndex]
                                            ['name']!,
                                        imageUrl: dataAttractions[dataIndex]
                                            ['imageUrl']!,
                                        distance: dataAttractions[dataIndex]
                                            ['distance']!,
                                        price: dataAttractions[dataIndex]
                                            ['price']!,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double
                              .infinity, // Đặt chiều rộng của Container là không giới hạn

                          // Đặt chiều cao của Container
                          child: GridView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, // Số cột
                                    mainAxisExtent: 240,
                                    childAspectRatio: 3 / 4,
                                    crossAxisSpacing: 30,
                                    mainAxisSpacing: 20),
                            children: dataAttractions.map((item) {
                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/detailScreen',
                                    arguments: {'name': item['name']!},
                                  );
                                },
                                child: ExploreCard(
                                    name: item['name']!,
                                    imageUrl: item['imageUrl']!,
                                    distance: item['distance']!,
                                    price: item['price']!),
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
