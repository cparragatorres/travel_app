// To parse this JSON data, do
//
//     final agencyModel = agencyModelFromJson(jsonString);

import 'dart:convert';

AgencyModel agencyModelFromJson(String str) =>
    AgencyModel.fromJson(json.decode(str));

String agencyModelToJson(AgencyModel data) => json.encode(data.toJson());

class AgencyModel {
  AgencyModel({
    required this.circuit,
    required this.name,
    required this.department,
    this.id,
  });

  Circuit circuit;
  String name;
  String department;
  String? id;

  factory AgencyModel.fromJson(Map<String, dynamic> json) => AgencyModel(
        circuit: Circuit.fromJson(json["circuit"]),
        name: json["name"],
        department: json["department"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "circuit": circuit.toJson(),
        "name": name,
        "department": department,
        "id": id,
      };
}

class Circuit {
  Circuit({
    required this.circuit0,
    required this.circuit1,
    required this.circuit2,
  });

  Circuit0Class circuit0;
  Circuit0Class circuit1;
  Circuit0Class circuit2;

  factory Circuit.fromJson(Map<String, dynamic> json) => Circuit(
        circuit0: Circuit0Class.fromJson(json["circuit_0"]),
        circuit1: Circuit0Class.fromJson(json["circuit_1"]),
        circuit2: Circuit0Class.fromJson(json["circuit_2"]),
      );

  Map<String, dynamic> toJson() => {
        "circuit_0": circuit0.toJson(),
        "circuit_1": circuit1.toJson(),
        "circuit_2": circuit2.toJson(),
      };
}

class Circuit0Class {
  Circuit0Class({
    required this.image,
    required this.cost,
    required this.name,
    required this.departure,
    required this.comeback,
    required this.points,
  });

  List<String> image;
  int cost;
  String name;
  String departure;
  String comeback;
  List<String> points;

  factory Circuit0Class.fromJson(Map<String, dynamic> json) => Circuit0Class(
        image: List<String>.from(json["image"].map((x) => x)),
        cost: json["cost"],
        name: json["name"],
        departure: json["departure"],
        comeback: json["comeback"],
        points: List<String>.from(json["points"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "image": List<dynamic>.from(image.map((x) => x)),
        "cost": cost,
        "name": name,
        "departure": departure,
        "comeback": comeback,
        "points": List<dynamic>.from(points.map((x) => x)),
      };
}
