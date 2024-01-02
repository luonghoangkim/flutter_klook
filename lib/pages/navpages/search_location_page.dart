import 'package:apptest/widgets/app_color.dart';
import 'package:flutter/material.dart';

const Duration fakeAPIDuration = Duration(seconds: 1);

class SearchLocationPage extends StatefulWidget {
  @override
  _SearchLocationPageState createState() => _SearchLocationPageState();
}

class _SearchLocationPageState extends State<SearchLocationPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _foundUsers = [];

  @override
  initState() {
    _foundUsers = _FakeAPI._kOptions;
    super.initState();
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

  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
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
          ),
          onChanged: (value) {
            setState(() {
              isSearching = value.isNotEmpty;
              _runFilter(value);
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
                _foundUsers.isNotEmpty
                    ? Container(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: _foundUsers.length,
                          itemBuilder: (context, index) => Card(
                            key: ValueKey(_foundUsers[index]["id"]),
                            elevation: 4,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: InkWell(
                              onTap: () {
                                var id = _foundUsers[index]["id"]!;
                                var name = _foundUsers[index]['name']!;
                                var country = _foundUsers[index]['country']!;
                                _handleLocationSelection(id, name, country);
                              },
                              child: ListTile(
                                leading: const Icon(Icons.thumb_up_off_alt),
                                title: Text(
                                  _foundUsers[index]['name']!,
                                  style: const TextStyle(color: Colors.black),
                                ),
                                subtitle: Text(_foundUsers[index]['country']!),
                              ),
                            ),
                          ),
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
                      "Vị trí của tôi",
                      style: TextStyle(
                          fontSize: 14, height: 3, fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.listTitleColor,
                            borderRadius: BorderRadius.circular(16)),
                        padding: const EdgeInsets.all(8.0),
                        child: const IntrinsicWidth(
                          child: Row(children: [
                            Icon(
                              Icons.location_on,
                              size: 14,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(child: Text('Khám phá những địa điểm gần đây'))
                          ]),
                        ),
                      ),
                    ),
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
                              color: AppColors.listTitleColor,
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
    {'id': '2', 'name': 'Hồng Công', 'country': 'Trung Quốc'},
    {'id': '3', 'name': 'Tokyo', 'country': 'Nhật Bản'},
    {'id': '4', 'name': 'Đài Bắc', 'country': 'Đài Loan'},
    {'id': '5', 'name': 'Tân Gia Ba', 'country': 'Trung Quốc'},
    {'id': '6', 'name': 'BăngKok', 'country': 'Thái Lan'},
    {'id': '7', 'name': 'Osaka', 'country': 'Nhật Bản'},
    {'id': '8', 'name': 'New York', 'country': 'United States'},
    {'id': '9', 'name': 'Paris', 'country': 'France'},
    {'id': '10', 'name': 'London', 'country': 'United Kingdom'},
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
