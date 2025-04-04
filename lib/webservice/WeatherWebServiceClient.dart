import 'dart:convert';

import 'package:weather_app/model/PlaceModel.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/PlaceWeatherModel.dart';

class WeatherWebServiceClient {
  final String apiKey = 'API_KEY'; // reemplaza con tu key
  final String baseUrl = 'https://www.meteosource.com/api/v1/free';

  Future<List<PlaceModel>> searchPlaces(String prefix) async {
    final response = await http.get(Uri.parse(
        '$baseUrl/find_places_prefix?text=$prefix&key=$apiKey'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      return data.map((e) => PlaceModel.fromJson(e)).toList();
    } else {
      throw Exception('Error buscando lugares');
    }
  }

  Future<PlaceWeatherModel> getWeather(String placeId) async {
    final response = await http.get(Uri.parse(
        '$baseUrl/point?place_id=$placeId&sections=current,hourly&timezone=auto&key=$apiKey'));

    if (response.statusCode == 200) {
      return PlaceWeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error obteniendo el clima');
    }
  }
}