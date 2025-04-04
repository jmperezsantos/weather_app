// To parse this JSON data, do
//
//     final placeWeatherModel = placeWeatherModelFromJson(jsonString);

import 'dart:convert';

PlaceWeatherModel placeWeatherModelFromJson(String str) => PlaceWeatherModel.fromJson(json.decode(str));

String placeWeatherModelToJson(PlaceWeatherModel data) => json.encode(data.toJson());

class PlaceWeatherModel {
  String lat;
  String lon;
  int elevation;
  String timezone;
  String units;
  Current current;
  Hourly hourly;

  PlaceWeatherModel({
    required this.lat,
    required this.lon,
    required this.elevation,
    required this.timezone,
    required this.units,
    required this.current,
    required this.hourly,
  });

  factory PlaceWeatherModel.fromJson(Map<String, dynamic> json) =>
      PlaceWeatherModel(
        lat: json["lat"],
        lon: json["lon"],
        elevation: json["elevation"],
        timezone: json["timezone"],
        units: json["units"],
        current: Current.fromJson(json["current"]),
        hourly: Hourly.fromJson(json["hourly"]),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
        "elevation": elevation,
        "timezone": timezone,
        "units": units,
        "current": current.toJson(),
        "hourly": hourly.toJson(),
      };
}

class Current {
  String icon;
  int iconNum;
  String summary;
  double temperature;
  Wind wind;
  Precipitation precipitation;

  Current({
    required this.icon,
    required this.iconNum,
    required this.summary,
    required this.temperature,
    required this.wind,
    required this.precipitation
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        icon: json["icon"],
        iconNum: json["icon_num"],
        summary: json["summary"],
        temperature: json["temperature"]?.toDouble(),
        wind: Wind.fromJson(json["wind"]),
        precipitation: Precipitation.fromJson(json["precipitation"])
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "icon_num": iconNum,
        "summary": summary,
        "temperature": temperature,
        "wind": wind.toJson(),
        "precipitation": precipitation.toJson()
      };
}

class Precipitation {
  double total;
  String type;

  Precipitation({
    required this.total,
    required this.type,
  });

  factory Precipitation.fromJson(Map<String, dynamic> json) => Precipitation(
        total: json["total"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "type": type,
      };
}

class Wind {
  double speed;
  int angle;
  String dir;

  Wind({
    required this.speed,
    required this.angle,
    required this.dir,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"],
        angle: json["angle"],
        dir: json["dir"],
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "angle": angle,
        "dir": dir,
      };
}

class Hourly {
  List<Datum> data;

  Hourly({
    required this.data,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String date;
  String weather;
  int icon;
  String summary;
  double temperature;
  Wind wind;
  Precipitation precipitation;

  Datum({
    required this.date,
    required this.weather,
    required this.icon,
    required this.summary,
    required this.temperature,
    required this.wind,
    required this.precipitation,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        date: json["date"],
        weather: json["weather"],
        icon: json["icon"],
        summary: json["summary"],
        temperature: json["temperature"]?.toDouble(),
        wind: Wind.fromJson(json["wind"]),
        precipitation: Precipitation.fromJson(json["precipitation"]),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "weather": weather,
        "icon": icon,
        "summary": summary,
        "temperature": temperature,
        "wind": wind.toJson(),
        "precipitation": precipitation.toJson(),
      };
}