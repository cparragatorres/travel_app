// To parse this JSON data, do
//
//     final destinationModel = destinationModelFromJson(jsonString);

import 'dart:convert';

DestinationModel destinationModelFromJson(String str) =>
    DestinationModel.fromJson(json.decode(str));

String destinationModelToJson(DestinationModel data) =>
    json.encode(data.toJson());

class DestinationModel {
  DestinationModel({
    required this.image,
    required this.department,
    required this.name,
    required this.id,
  });

  String image;
  String department;
  String name;
  String id;

  factory DestinationModel.fromJson(Map<String, dynamic> json) =>
      DestinationModel(
        image: json["image"],
        department: json["department"],
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "department": department,
        "name": name,
        "id": id,
      };
}
