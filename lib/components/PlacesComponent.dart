import 'package:flutter/material.dart';

class PlacesComponent extends StatelessWidget {

  String city;
  String country;

  PlacesComponent({
    required this.city,
    required this.country
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(city),
      Spacer(),
      Text(country)
    ]);
  }
}
