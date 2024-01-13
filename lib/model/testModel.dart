
class HotelModel {
  int? createdAt;
  String? nameHotel;
  String? img;
  String? prince;
  String? rate;
  String? id;

  HotelModel({this.createdAt, this.nameHotel, this.img, this.prince, this.rate, this.id});

  HotelModel.fromJson(Map<String, dynamic> json) {
    createdAt = json["createdAt"];
    nameHotel = json["nameHotel"];
    img = json["img"];
    prince = json["prince"];
    rate = json["rate"];
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["createdAt"] = createdAt;
    _data["nameHotel"] = nameHotel;
    _data["img"] = img;
    _data["prince"] = prince;
    _data["rate"] = rate;
    _data["id"] = id;
    return _data;
  }
}