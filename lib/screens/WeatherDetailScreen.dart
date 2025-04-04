import 'package:flutter/material.dart';
import 'package:weather_app/model/PlaceModel.dart';
import 'package:weather_app/model/PlaceWeatherModel.dart';
import 'package:weather_app/webservice/WeatherWebServiceClient.dart';

class WeatherDetailScreen extends StatefulWidget {
  final PlaceModel place;

  const WeatherDetailScreen({super.key, required this.place});

  @override
  State<WeatherDetailScreen> createState() => _WeatherDetailScreenState();
}

class _WeatherDetailScreenState extends State<WeatherDetailScreen> {
  final _service = WeatherWebServiceClient();
  PlaceWeatherModel? _weather;

  @override
  void initState() {
    super.initState();
    _loadWeather();
  }

  void _loadWeather() async {
    final weather = await _service.getWeather(widget.place.placeId);
    setState(() => _weather = weather);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.place.name)),
      body: _weather == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.blue[100],
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _weather!.current.summary,
                        style: const TextStyle(fontSize: 24),
                      ),
                      Text(
                        '${_weather!.current.temperature}°C',
                        style: const TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('Pronóstico por hora',
                      style: TextStyle(fontSize: 18)),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(8),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 2.5,
                    ),
                    itemCount: _weather!.hourly.data.length,
                    itemBuilder: (context, index) {
                      final h = _weather!.hourly.data[index];
                      return Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(h.date.substring(11, 16)),
                            Text('${h.temperature}°C'),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
