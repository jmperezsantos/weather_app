// To parse this JSON data, do
//
//     final placeModel = placeModelFromJson(jsonString);

import 'dart:convert';

PlaceModel placeModelFromJson(String str) => PlaceModel.fromJson(json.decode(str));

String placeModelToJson(PlaceModel data) => json.encode(data.toJson());

class PlaceModel {
  String name;
  String placeId;
  String admArea1;
  String admArea2;
  String country;
  String lat;
  String lon;
  String timezone;
  String type;

  PlaceModel({
    required this.name,
    required this.placeId,
    required this.admArea1,
    required this.admArea2,
    required this.country,
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.type,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
        name: json["name"],
        placeId: json["place_id"],
        admArea1: json["adm_area1"],
        admArea2: json["adm_area2"],
        country: json["country"],
        lat: json["lat"],
        lon: json["lon"],
        timezone: json["timezone"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "place_id": placeId,
        "adm_area1": admArea1,
        "adm_area2": admArea2,
        "country": country,
        "lat": lat,
        "lon": lon,
        "timezone": timezone,
        "type": type,
      };
}
