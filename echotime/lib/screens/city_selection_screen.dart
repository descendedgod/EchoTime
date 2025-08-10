import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/city_provider.dart';
import '../utils/city_list.dart';

class CitySelectionScreen extends StatefulWidget {
  @override
  _CitySelectionScreenState createState() => _CitySelectionScreenState();
}

class _CitySelectionScreenState extends State<CitySelectionScreen> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredCities = cities
        .where((city) =>
            city.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Select City',
            style:
                TextStyle(color: Color(0xFF00FF41), fontFamily: 'RobotoMono')),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style:
                  TextStyle(color: Color(0xFF00FF41), fontFamily: 'RobotoMono'),
              decoration: InputDecoration(
                hintText: 'Search city...',
                hintStyle: TextStyle(color: Color(0xFF00FF41)),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF00FF41))),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF00FF41))),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCities.length,
              itemBuilder: (context, index) {
                final city = filteredCities[index];
                return ListTile(
                  title: Text(city.name,
                      style: TextStyle(
                          color: Color(0xFF00FF41), fontFamily: 'RobotoMono')),
                  subtitle: Text(city.country,
                      style: TextStyle(
                          color: Colors.grey, fontFamily: 'RobotoMono')),
                  onTap: () {
                    Provider.of<CityProvider>(context, listen: false)
                        .selectCity(city);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
