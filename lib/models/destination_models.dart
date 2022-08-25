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
    required this.costo,
    required this.descripcion,
    required this.nombreagencia,
    required this.nombrecircuito,
    required this.partida,
    required this.retorno,
    this.id,
  });

  String image;
  String department;
  String name;
  int costo;
  String descripcion;
  String nombreagencia;
  String nombrecircuito;
  String partida;
  String retorno;
  String? id;

  factory DestinationModel.fromJson(Map<String, dynamic> json) =>
      DestinationModel(
        image: json["image"],
        department: json["department"],
        name: json["name"],
        costo: json["costo"],
        descripcion: json["descripcion"],
        nombreagencia: json["nombreagencia"],
        nombrecircuito: json["nombrecircuito"],
        partida: json["partida"],
        retorno: json["retorno"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "department": department,
        "name": name,
        "costo": costo,
        "descripcion": descripcion,
        "nombreagencia": nombreagencia,
        "nombrecircuito": nombrecircuito,
        "partida": partida,
        "retorno": retorno,
        "id": id,
      };
}
