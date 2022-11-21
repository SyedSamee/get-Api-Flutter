import 'dart:convert';

List<dataModel> dataModelFromJson(String str) =>
    List<dataModel>.from(json.decode(str).map((x) => dataModel.fromJson(x)));

String dataModelToJson(List<dataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.tojson())));

class dataModel {
  String name;
  int age;
  dataModel({required this.name, required this.age});

  factory dataModel.fromJson(Map json) =>
      dataModel(name: json['name'], age: json['id']);

  Map<String, dynamic> tojson() => {'name': name};
}
