import 'package:apptest/theme/app_color.dart';
import 'package:apptest/widgets/custom_textbutton_hotel.dart';
import 'package:apptest/widgets/evalute_card_hotel.dart';
import 'package:apptest/widgets/icon_button_appbar.dart';
import 'package:apptest/widgets/linear_progress.dart';
import 'package:apptest/widgets/list_hotel_cart.dart';
import 'package:apptest/widgets/nearby_place.dart';
import 'package:apptest/widgets/rating_hotel.dart';
import 'package:apptest/widgets/start_rating.dart';
import 'package:apptest/widgets/text_bg_radius.dart';
import 'package:apptest/widgets/tility_tile.dart';
import 'package:apptest/widgets/title_detail_hotel.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class DetailHotelScreen extends StatefulWidget {
  const DetailHotelScreen({super.key});

  @override
  State<DetailHotelScreen> createState() => _DetailHotelScreenState();
}

class _DetailHotelScreenState extends State<DetailHotelScreen> {
  double _scrollPosition = 0;

  int _currentImageIndex = 0;
  final CarouselController _controller = CarouselController();

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _scrollPosition = _scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
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
            backgroundColor: AppColors.whiteColor,
            elevation: 0,
            floating: false,
            snap: false,
            pinned: true,
            centerTitle: false,
            stretch: true,
            expandedHeight: 230.0,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: Container(
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(26),
                      topRight: Radius.circular(26)),
                ),
                child: const Text(''),
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
                    bottom: 20.0,
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
                      const Row(children: [
                        RatingRow(rating: '4.7/5', status: 'Tốt'),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
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
                                      style: TextStyle(color: Colors.grey[800]),
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
                                      style: TextStyle(color: Colors.grey[800]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              child: const Icon(Icons.navigate_next),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: const DecorationImage(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Flexible(
                            flex: 3,
                            child: Column(children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Thứ 4',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.textTitleColor)),
                                  Text('Thứ 5',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.textTitleColor)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('17/1',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text('-1 đêm-',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.textTitleColor)),
                                  Text('18/1',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ],
                              )
                            ]),
                          ),
                          Flexible(
                            flex: 1,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                  height: 30,
                                  width: 1,
                                  color: AppColors.textTitleColor,
                                ),
                                const Icon(Icons.meeting_room,
                                    color: AppColors.textTitleColor, size: 16),
                                const Text('1',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    )),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(Icons.person,
                                    color: AppColors.textTitleColor, size: 16),
                                const Text('2',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 0.5,
                        color: AppColors.listTitleColor,
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
                      const Divider(
                        thickness: 0.5,
                        color: AppColors.listTitleColor,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return ListHotelCard(
                            title: 'Deluxe Double Room ${index + 1}',
                            subTitle: '25.0 m2',
                            price: '\$30',
                            imagePath: 'img/img_hotel${index + 1}.jpeg', details: [],
                          );
                        },
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.listTitleColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(16)),
                        child: Row(
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('img/coin_hotel.png'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Flexible(
                              child: Text(
                                  'Nhận credit cho đơn hàng này & tiết kiệm cho lần sau'),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(Icons.navigate_next)
                          ],
                        ),
                      ),
                      const CustomTitleRow(title: 'Đánh giá'),
                      Column(
                        children: [
                          Row(
                            children: [
                              RichText(
                                text: const TextSpan(
                                  text: '4.7',
                                  style: TextStyle(
                                      fontSize: 44,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '/5',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: AppColors.textTitleColor)),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Tốt',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                  Text('12 bình luận',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.textTitleColor))
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              LinerProgress(
                                label: 'Vị trí',
                                rating: 4.6,
                              ),
                              SizedBox(width: 8),
                              LinerProgress(
                                label: 'Dịch vụ',
                                rating: 4.8,
                              ),
                            ],
                          ),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              LinerProgress(
                                label: 'Sạch sẽ',
                                rating: 4.6,
                              ),
                              SizedBox(width: 8),
                              LinerProgress(
                                label: 'Không gian và tiện nghi',
                                rating: 4.7,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Wrap(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  margin: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2,
                                        color: AppColors.listTitleColor),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                  child: const IntrinsicWidth(
                                    child: Text(
                                      'Tất cả',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  margin: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2,
                                        color: AppColors.listTitleColor),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                  child: const IntrinsicWidth(
                                    child: Text(
                                      'Có hình ảnh',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  margin: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2,
                                        color: AppColors.listTitleColor),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                  child: const IntrinsicWidth(
                                    child: Text(
                                      '4.5 +',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  margin: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2,
                                        color: AppColors.listTitleColor),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                  child: const IntrinsicWidth(
                                    child: Text(
                                      '3.5 +',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 210,
                            child: Swiper(
                              loop: false,
                              viewportFraction: 0.95,
                              itemBuilder: (BuildContext context, int index) {
                                Map<String, dynamic> data =
                                    evaluteCardData[index];
                                return EvaluteCardHotel(
                                  customerName: data['customerName'],
                                  date: data['date'],
                                  rating: data['rating'],
                                  category: data['category'],
                                  reviewContent: data['reviewContent'],
                                );
                              },
                              itemCount: 5,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextButton(
                            buttonText: '12 Bình luận',
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const CustomTitleRow(title: 'Điểm tham quan gần đó'),
                      Column(
                        children: [
                          Container(
                            height: 90,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage('img/map_exam_hotel.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.location_on,
                                    size: 20, color: AppColors.primaryColor),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Colors.white),
                                  child: const Text('Xem bản đồ',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.primaryColor)),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.all(0),
                            shrinkWrap: true,
                            itemCount: locations.length * 2 - 1,
                            itemBuilder: (context, index) {
                              if (index.isOdd) {
                                return const Divider(
                                    color: AppColors.listTitleColor);
                              }

                              final locationIndex = index ~/ 2;
                              final location = locations[locationIndex];

                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      flex: 2,
                                      child: Text(location['name']!,
                                          style: const TextStyle(fontSize: 16)),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: Text(location['distance']!,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.textTitleColor)),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const CustomTitleRow(title: 'Dịch vụ và cơ sở vật chất'),
                      Column(
                        children: [
                          TilityList(data: tilities),
                          const Divider(
                            thickness: 0.5,
                          ),
                          TilityList(data: infrastructure),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextButton(
                            buttonText: 'Xem tất cả tiện nghi',
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const CustomTitleRow(title: 'Chính sách chỗ lưu trú'),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: AppColors.listTitleColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      color: AppColors.textTitleColor,
                                      size: 16,
                                    ),
                                    SizedBox(width: 5),
                                    Flexible(
                                      child: Text(
                                        'Giờ nhận phòng 2:00 PM ~ midnight',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      color: AppColors.textTitleColor,
                                      size: 16,
                                    ),
                                    SizedBox(width: 5),
                                    Flexible(
                                      child: Text(
                                        'Giờ trả phòng 12:00 PM ',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text('Chính sách nhận phòng',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                              'Lưu ý: Chính sách nhận phòng khác nhau tùy theo chỗ lưu trú. Vui lòng kiểm tra cẩn thận trước khi đặt phòng'),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextButton(
                            buttonText: 'Xem tất cả chính sách',
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const CustomTitleRow(title: 'Mô tả'),
                      Column(
                        children: [
                          const Text(
                              'Hotel Nikko Saigon ở trung tâm Thành phố Hồ Chí Minh, cách Chợ Bến Thành và Chợ hoa Hồ Thị Kỷ 5 phút lái xe. Khách sạn 5 này cách Phố đi bộ Bùi Viện 0,8 mi (1,4 km) và Phạm Ngũ Lão 0,7 mi (1,2 km).'),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextButton(
                            buttonText: 'Xem tất cả',
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const CustomTitleRow(title: 'Chỗ lưu trú gần đó'),
                      SizedBox(
                        height: 200,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: dataCustomNearbyPlaceCard.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            crossAxisSpacing: 10.0,
                          ),
                          itemBuilder: (context, index) {
                            final item = dataCustomNearbyPlaceCard[index];
                            return CustomNearbyPlaceCard(
                              imagePath: item['imagePath'],
                              hotelName: item['hotelName'],
                              rating: item['rating'],
                              ratingStatus: item['ratingStatus'],
                              price: item['price'],
                            );
                          },
                        ),
                      )
                    ],
                  ),
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
