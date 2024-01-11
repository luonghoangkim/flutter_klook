class TodoModel {
  String? title;
  String? name;
  String? id;

  TodoModel({this.title, this.name, this.id});

  TodoModel.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    name = json["name"];
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    _data["name"] = name;
    _data["id"] = id;
    return _data;
  }

  TodoModel copyWith({String? title, String? name}) {
    return TodoModel(
      title: title ?? this.title,
      name: name ?? this.name,
      id: id,
    );
  }
}
