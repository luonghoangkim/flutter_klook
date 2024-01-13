import 'package:apptest/model/home_model.dart';
import 'package:apptest/widgets/app_color.dart';
import 'package:apptest/widgets/search_Card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const Duration fakeAPIDuration = Duration(seconds: 1);

class SearchLocationPage extends StatefulWidget {
  @override
  _SearchLocationPageState createState() => _SearchLocationPageState();
}

class _SearchLocationPageState extends State<SearchLocationPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  late TabController tabController;
  List<Map<String, String>> _foundUsers = [];
  List<Map<String, String>> _foundSearch = [];

  @override
  initState() {
    _foundUsers = _FakeAPI._kOptions;
    _foundSearch = _FakeSearch._kOptions;
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void _runFilter(String enteredKeyword) {
    setState(() {
      if (enteredKeyword.isEmpty) {
        _foundUsers = _FakeAPI._kOptions.toList();
      } else {
        _foundUsers = _FakeAPI._kOptions
            .where((user) => user["name"]!
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
            .toList();
      }
    });
  }

  void _runFilter2(String enteredKeyword) {
    setState(() {
      if (enteredKeyword.isEmpty) {
        _foundSearch = _FakeSearch._kOptions.toList();
      } else {
        _foundSearch = _FakeSearch._kOptions
            .where((user) => user["title"]!
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
            .toList();
      }
    });
  }

  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> dataSearch = DataHome.SearchData();

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.close)),
        title: TextField(
          cursorColor: AppColors.primaryColor,
          controller: _searchController,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 2, color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(99),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 2, color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(99),
            ),
            contentPadding: const EdgeInsets.fromLTRB(20, 8, 2, 8),
            hintText: 'Thành phố , khu vực , tên khách sạn, địa điểm gần đó',
            hintStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            suffixIcon: Container(
              width: 50,
              height: 15,
              margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
              // padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.search,
                  size: 18,
                ),
                color: Colors.white,
                onPressed: () {
                  // Xử lý tìm kiếm tại đây
                  // _runFilter2(_searchController.text);
                },
              ),
            ),
          ),
          onChanged: (value) {
            setState(() {
              isSearching = value.isNotEmpty;
              // _runFilter(value);
              _runFilter2(value);
            });
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isSearching)
                _foundSearch.isNotEmpty
                    ? Container(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: _foundUsers.length,
                          itemBuilder: (context, index) {
                            if (index >= 0 && index < _foundSearch.length) {
                              return Card(
                                key: ValueKey(_foundSearch[index]["id"]),
                                elevation: 14,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: InkWell(
                                  onTap: () {
                                    var id = _foundSearch[index]['id']!;
                                    var name = _foundSearch[index]['title']!;
                                    var country = 'country';
                                    _handleLocationSelection(id, name, country);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SearchCard(
                                      title: _foundSearch[index]['title']!,
                                      imageUrl: _foundSearch[index]['img']!,
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return SizedBox
                                  .shrink(); // Trả về một widget rỗng nếu index nằm ngoài phạm vi
                            }
                          },
                        ),
                      )
                    : Text(
                        'Rất tiếc không tìm thấy kết quả cho "${_searchController.text}"',
                        style: const TextStyle(fontSize: 16),
                      )
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Tên điểm đến hot",
                      style: TextStyle(
                          fontSize: 14, height: 3, fontWeight: FontWeight.w600),
                    ),
                    Wrap(
                      children: _FakeAPI._kOptions.map((location) {
                        final String id = location['id']!;
                        final String name = location['name']!;
                        final String country = location['country']!;
                        return InkWell(
                          onTap: () {
                            _handleLocationSelection(id, name, country);
                          },
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: const EdgeInsets.all(8.0),
                            child: IntrinsicWidth(
                              child: Text(name),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          SizedBox(height: 50),
                          Container(
                            // height: 50,
                            width: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(5),
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
                          Expanded(
                            child: TabBarView(
                              controller: tabController,
                              children: [
                                Center(
                                  child: Container(
                                    // Apply padding, margin, or decoration as needed
                                    padding:
                                        EdgeInsets.all(8.0), // Example padding
                                    decoration: BoxDecoration(
                                      // Example decoration
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Color.fromARGB(255, 193, 191,
                                            191), // Màu đường viền
                                        width: 1.0, // Độ rộng của đường viền
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ListView(
                                      children: dataSearch.map((item) {
                                        return InkWell(
                                          onTap: () {
                                            var id = "id";
                                            var name = item['title']!;
                                            var country = 'country';
                                            Navigator.pushNamed(
                                              context,
                                              '/detailScreen',
                                              arguments: {
                                                'name': name,
                                                'country': country
                                              },
                                            );
                                          },
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SearchCard(
                                                  title: item['title']!,
                                                  imageUrl: item['img']!)),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    // Apply padding, margin, or decoration as needed
                                    padding:
                                        EdgeInsets.all(8.0), // Example padding
                                    decoration: BoxDecoration(
                                      // Example decoration
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Color.fromARGB(255, 193, 191,
                                            191), // Màu đường viền
                                        width: 1.0, // Độ rộng của đường viền
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ListView(
                                      children: dataSearch.map((item) {
                                        return InkWell(
                                          onTap: () {
                                            var id = "id";
                                            var name = item['title']!;
                                            var country = 'country';
                                            _handleLocationSelection(
                                                id, name, country);
                                          },
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SearchCard(
                                                  title: item['title']!,
                                                  imageUrl: item['img']!)),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    // Apply padding, margin, or decoration as needed
                                    padding:
                                        EdgeInsets.all(8.0), // Example padding
                                    decoration: BoxDecoration(
                                      // Example decoration
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Color.fromARGB(255, 193, 191,
                                            191), // Màu đường viền
                                        width: 1.0, // Độ rộng của đường viền
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ListView(
                                      children: dataSearch.map((item) {
                                        return InkWell(
                                          onTap: () {
                                            var id = "id";
                                            var name = item['title']!;
                                            var country = 'country';
                                            _handleLocationSelection(
                                                id, name, country);
                                          },
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SearchCard(
                                                  title: item['title']!,
                                                  imageUrl: item['img']!)),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    // Apply padding, margin, or decoration as needed
                                    padding:
                                        EdgeInsets.all(8.0), // Example padding
                                    decoration: BoxDecoration(
                                      // Example decoration
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Color.fromARGB(255, 193, 191,
                                            191), // Màu đường viền
                                        width: 1.0, // Độ rộng của đường viền
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ListView(
                                      children: dataSearch.map((item) {
                                        return InkWell(
                                          onTap: () {
                                            var id = "id";
                                            var name = item['title']!;
                                            var country = 'country';
                                            _handleLocationSelection(
                                                id, name, country);
                                          },
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SearchCard(
                                                  title: item['title']!,
                                                  imageUrl: item['img']!)),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                // Content for Tab 2
                                Center(
                                  child: Text('no data'),
                                )
                                // Content for Tab 2
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleLocationSelection(
      String selectedLocation, String name, String country) {
    Navigator.pop(context, {'name': name, 'country': country});
  }
}

class _FakeAPI {
  static const List<Map<String, String>> _kOptions = [
    {'id': '1', 'name': 'Thành phố Hồ Chí Minh', 'country': 'Việt Nam'},
    {'id': '2', 'name': 'Bắc Kinh', 'country': 'Trung Quốc'},
    {'id': '3', 'name': 'Osaka', 'country': 'Nhật Bản'},
    {'id': '4', 'name': 'Đài Bắc', 'country': 'Đài Loan'},
    {'id': '5', 'name': 'Seoul', 'country': 'Hàn Quốc'},
    {'id': '6', 'name': 'BăngKok', 'country': 'Thái Lan'},
    {'id': '7', 'name': 'Osaka', 'country': 'Nhật Bản'},
    {'id': '8', 'name': 'Washington', 'country': 'United States'},
    {'id': '9', 'name': 'Paris', 'country': 'France'},
    {'id': '10', 'name': 'Manchester', 'country': 'United Kingdom'},
  ];

  // static Future<Iterable<Map<String, String>>> search(String query) async {
  //   await Future<void>.delayed(fakeAPIDuration);
  //   if (query == '') {
  //     return const Iterable<Map<String, String>>.empty();
  //   }
  //   return _kOptions.where((option) {
  //     return option['name']!.toLowerCase().contains(query.toLowerCase());
  //   });
  // }
}

class _FakeSearch {
  static const List<Map<String, String>> _kOptions = [
    {
      'id': '1',
      'img': 'img/Travel1.webp',
      'title': 'Bangkok',
    },
    {
      'id': '2',
      'img': 'img/recent_bg2.webp',
      'title': 'TP. Hồ Chí Minh',
    },
    {
      'id': '3',
      'img': 'img/travel2.webp',
      'title': 'Đài Bắc',
    },
    {
      'id': '4',
      'img': 'img/recent_bg2.webp',
      'title': 'Đà Lạt',
    },
    {
      'id': '5',
      'img': 'img/Recent_bg1.webp',
      'title': 'Singapore',
    },
    {
      'id': '6',
      'img': 'img/recent_bg2.webp',
      'title': 'Nha Trang',
    },
  ];

  // static Future<Iterable<Map<String, String>>> search(String query) async {
  //   await Future<void>.delayed(fakeAPIDuration);
  //   if (query == '') {
  //     return const Iterable<Map<String, String>>.empty();
  //   }
  //   return _kOptions.where((option) {
  //     return option['name']!.toLowerCase().contains(query.toLowerCase());
  //   });
  // }
}
