import 'package:flutter/cupertino.dart';
import 'package:weather_app/model/PlaceWeatherModel.dart';

class PlecaDetail extends StatelessWidget {
  PlaceWeatherModel weather;

  PlecaDetail({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              weather!.current.summary,
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              '${weather!.current.temperature}°C',
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const Spacer(),
        Image(
          image: AssetImage(
              "assets/weather_icons/${weather!.current.iconNum}.png"),
        )
      ],
    );
  }
}
