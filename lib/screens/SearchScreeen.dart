import 'package:flutter/material.dart';
import 'package:weather_app/model/PlaceModel.dart';
import 'package:weather_app/screens/WeatherDetailScreen.dart';
import 'package:weather_app/webservice/WeatherWebServiceClient.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();
  final _service = WeatherWebServiceClient();
  List<PlaceModel> _results = [];
  bool _loading = false;

  void _search(String query) async {
    if (query.length < 3) return;
    setState(() => _loading = true);
    try {
      final places = await _service.searchPlaces(query);
      setState(() => _results = places);
    } catch (e) {
      print(e);
    }
    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buscar Ciudad')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Ciudad...'),
              onSubmitted: _search,
            ),
            const SizedBox(height: 16),
            if (_loading) const CircularProgressIndicator(),
            Expanded(
              child: ListView.builder(
                itemCount: _results.length,
                itemBuilder: (context, index) {
                  final place = _results[index];
                  return ListTile(
                    title: Text('${place.name}, ${place.country}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => WeatherDetailScreen(place: place),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
