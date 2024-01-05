import 'package:apptest/widgets/app_color.dart';
import 'package:apptest/widgets/icon_button_appbar.dart';
import 'package:apptest/widgets/start_rating.dart';
import 'package:apptest/widgets/text_bg_radius.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailHotelScreen extends StatefulWidget {
  const DetailHotelScreen({super.key});

  @override
  State<DetailHotelScreen> createState() => _DetailHotelScreenState();
}

class _DetailHotelScreenState extends State<DetailHotelScreen> {
  double _scrollPosition = 0.0;

  int _currentImageIndex = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    final List<String> imageUrls = [
      'img/img_hotel1.jpeg',
      'img/img_hotel2.jpeg',
      'img/img_hotel3.jpeg',
      'img/img_hotel4.jpeg',
      'img/img_hotel5.jpeg',
    ];

    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo is ScrollUpdateNotification &&
              scrollInfo.metrics.pixels > 0) {
            setState(() {
              _scrollPosition = scrollInfo.metrics.pixels;
            });
          }
          return false;
        },
        child: CustomScrollView(
          // controller: _scrollController,
          slivers: [
            SliverAppBar(
              leading: Container(
                margin: const EdgeInsets.only(left: 5),
                child: IconButtonWidget(
                  iconData: Icons.navigate_before,
                  iconColor: Colors.black,
                  onPressed: () {
                    Get.back();
                  },
                  scrollPositionThreshold: 101.0,
                  scrollPosition: _scrollPosition,
                ),
              ),
              actions: <Widget>[
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _scrollPosition < 101
                            ? AppColors.matteBlack
                            : Colors.transparent,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.message, color: Colors.orange),
                        onPressed: () {},
                      ),
                    ),
                    IconButtonWidget(
                      iconData: Icons.open_in_new,
                      iconColor: Colors.black,
                      onPressed: () {},
                      scrollPositionThreshold: 101.0,
                      scrollPosition: _scrollPosition,
                    ),
                    IconButtonWidget(
                      iconData: Icons.favorite_border,
                      iconColor: Colors.black,
                      onPressed: () {},
                      scrollPositionThreshold: 101.0,
                      scrollPosition: _scrollPosition,
                    ),
                    IconButtonWidget(
                      iconData: Icons.help_outline,
                      iconColor: Colors.black,
                      onPressed: () {},
                      scrollPositionThreshold: 101.0,
                      scrollPosition: _scrollPosition,
                    ),
                  ],
                )
              ],
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              floating: false,
              snap: false,
              pinned: true,
              centerTitle: false,
              stretch: true,
              expandedHeight: 200.0,
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
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: 500,
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
                      left: 0,
                      right: 0,
                      bottom: 10.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: imageUrls.asMap().entries.map((entry) {
                                int index = entry.key;
                                return GestureDetector(
                                  onTap: () =>
                                      _controller.animateToPage(entry.key),
                                  child: Container(
                                    width: 8.0,
                                    height: 8.0,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
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
                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.matteBlack,
                                borderRadius: BorderRadius.circular(16)),
                            padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
                            margin: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.image,
                                  color: Colors.white,
                                  size: 12,
                                ),
                                Text(
                                  '${imageUrls.length}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
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
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(14),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Richico Soho Boutique Apartments And Hotel',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        StarRating(
                            rating: 4,
                            starColor: AppColors.primaryColor,
                            starSize: 16),
                        const SizedBox(
                          height: 8,
                        ),
                        Wrap(
                          children: [
                            CustomBarWidget(
                              text: 'flash sale',
                              textColor: AppColors.primaryColor,
                              backgroundColor:
                                  const Color.fromARGB(255, 249, 229, 218),
                              fontSize: 12,
                              onTap: () {},
                            ),
                            CustomBarWidget(
                              text: 'themeland hotel',
                              textColor: AppColors.accentColor,
                              backgroundColor:
                                  const Color.fromARGB(255, 195, 232, 247),
                              fontSize: 12,
                              onTap: () {},
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                    bottomLeft: Radius.circular(16)),
                                color: AppColors.purpleCustoms),
                            child: const Text(
                              '4.7/5',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text('Tốt',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: AppColors.purpleCustoms,
                                  fontSize: 16)),
                          const SizedBox(
                            width: 5,
                          ),
                          const Expanded(
                            child: Text('12 Bình luận',
                                style: TextStyle(
                                    color: AppColors.textTitleColor,
                                    fontSize: 14)),
                          )
                        ]),
                        Container(
                          margin: const EdgeInsets.only(top: 8, bottom: 8),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.listTitleColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(16)),
                          child: Row(
                            children: [
                              Flexible(
                                child: Row(
                                  children: [
                                    const Icon(Icons.pool_sharp),
                                    Flexible(
                                      child: Text(
                                        'Bể bơi (miễn phí) ',
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                            TextStyle(color: Colors.grey[800]),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Row(
                                  children: [
                                    const Icon(Icons.directions_car_outlined),
                                    Flexible(
                                      child: Text(
                                        'Đón và trả khách trạm tàu hoả, xe bus sân bay (có phụ phí)',
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                            TextStyle(color: Colors.grey[800]),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                child: Icon(Icons.navigate_next),
                                onTap: () {
                                  // Xử lý khi nhấp vào icon
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('img/bg_map_hotel.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: const ListTile(
                            title: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                '23 Hưng Gia 3, P.Tân Phong , Q.7',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ),
                            subtitle: Row(
                              children: [
                                Icon(Icons.airplanemode_active_outlined,
                                    size: 20),
                                Flexible(
                                  child: Text(
                                    'Sân bay quốc tế Tân Sơn Nhất, 11.1km',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.location_on,
                                    size: 20, color: AppColors.primaryColor),
                                Text('Bản đồ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.primaryColor)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 10,
                    color: AppColors.listTitleColor,
                  ),
                  Container(
                    padding: const EdgeInsets.all(14),
                    width: double.maxFinite,
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(children: [
                                      Text('Thứ 4'),
                                      Text('17/1')
                                    ]),
                                    Text('-1 đêm-'),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Column(children: [
                                      Text('Thứ 5'),
                                      Text('18/1')
                                    ]),
                                    Container(
                                      height: 20,
                                      width: 1,
                                      color: AppColors.primaryColor,
                                    ),
                                    const Row(
                                      children: [
                                        Icon(Icons.meeting_room),
                                        Text('1'),
                                        Icon(Icons.person),
                                        Text('1')
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ]),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(14),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Richico Soho Boutique Apartments And Hotel',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        StarRating(
                            rating: 4,
                            starColor: AppColors.primaryColor,
                            starSize: 16),
                        const SizedBox(
                          height: 8,
                        ),
                        Wrap(
                          children: [
                            CustomBarWidget(
                              text: 'flash sale',
                              textColor: AppColors.primaryColor,
                              backgroundColor:
                                  const Color.fromARGB(255, 249, 229, 218),
                              fontSize: 12,
                              onTap: () {},
                            ),
                            CustomBarWidget(
                              text: 'themeland hotel',
                              textColor: AppColors.accentColor,
                              backgroundColor:
                                  const Color.fromARGB(255, 195, 232, 247),
                              fontSize: 12,
                              onTap: () {},
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                    bottomLeft: Radius.circular(16)),
                                color: AppColors.purpleCustoms),
                            child: const Text(
                              '4.7/5',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text('Tốt',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: AppColors.purpleCustoms,
                                  fontSize: 16)),
                          const SizedBox(
                            width: 5,
                          ),
                          const Expanded(
                            child: Text('12 Bình luận',
                                style: TextStyle(
                                    color: AppColors.textTitleColor,
                                    fontSize: 14)),
                          )
                        ]),
                        Container(
                          margin: const EdgeInsets.only(top: 8, bottom: 8),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.listTitleColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(16)),
                          child: Row(
                            children: [
                              Flexible(
                                child: Row(
                                  children: [
                                    const Icon(Icons.pool_sharp),
                                    Flexible(
                                      child: Text(
                                        'Bể bơi (miễn phí) ',
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                            TextStyle(color: Colors.grey[800]),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Row(
                                  children: [
                                    const Icon(Icons.directions_car_outlined),
                                    Flexible(
                                      child: Text(
                                        'Đón và trả khách trạm tàu hoả, xe bus sân bay (có phụ phí)',
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                            TextStyle(color: Colors.grey[800]),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                child: Icon(Icons.navigate_next),
                                onTap: () {
                                  // Xử lý khi nhấp vào icon
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('img/bg_map_hotel.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: const ListTile(
                            title: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                '23 Hưng Gia 3, P.Tân Phong , Q.7',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ),
                            subtitle: Row(
                              children: [
                                Icon(Icons.airplanemode_active_outlined,
                                    size: 20),
                                Flexible(
                                  child: Text(
                                    'Sân bay quốc tế Tân Sơn Nhất, 11.1km',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.location_on,
                                    size: 20, color: AppColors.primaryColor),
                                Text('Bản đồ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.primaryColor)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 10,
                    color: AppColors.listTitleColor,
                  ),
                  Container(
                    padding: const EdgeInsets.all(14),
                    width: double.maxFinite,
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(children: [
                                      Text('Thứ 4'),
                                      Text('17/1')
                                    ]),
                                    Text('-1 đêm-'),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Column(children: [
                                      Text('Thứ 5'),
                                      Text('18/1')
                                    ]),
                                    Container(
                                      height: 20,
                                      width: 1,
                                      color: AppColors.primaryColor,
                                    ),
                                    const Row(
                                      children: [
                                        Icon(Icons.meeting_room),
                                        Text('1'),
                                        Icon(Icons.person),
                                        Text('1')
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ]),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
