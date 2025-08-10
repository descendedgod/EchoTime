import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/city_provider.dart';
import 'city_selection_screen.dart';
import 'package:intl/intl.dart';
// ...existing code...

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _time;
  String? _error;
  int? _hourDiff;
  DateTime? _cityTime;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _calculateCityTime();
    });
  }

  void _calculateCityTime() {
    final cityProvider = Provider.of<CityProvider>(context, listen: false);
    final city = cityProvider.selectedCity;
    final localTime = DateTime.now();
    final offsets = {
      'America/New_York': -4,
      'Europe/London': 0,
      'Asia/Tokyo': 9,
      'Australia/Sydney': 10,
      'Europe/Berlin': 2,
      'Europe/Moscow': 3,
      'Africa/Johannesburg': 2,
      'Asia/Dubai': 4,
      'Asia/Shanghai': 8,
      'America/Sao_Paulo': -3,
      // Add more as needed
    };
    final offset = offsets[city.timezone] ?? 0;
    final utcNow = DateTime.now().toUtc();
    final cityTime = utcNow.add(Duration(hours: offset));
    setState(() {
      _cityTime = cityTime;
      _time = DateFormat('HH:mm:ss').format(cityTime);
      _hourDiff = cityTime.hour - localTime.hour;
      _error = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cityProvider = Provider.of<CityProvider>(context);
    final city = cityProvider.selectedCity;

    return Scaffold(
      backgroundColor: Color(0xFF1C1C1C),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text('Echotime',
            style: TextStyle(
                color: Color(0xFF00FF41),
                fontFamily: 'RobotoMono',
                fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.location_city, color: Color(0xFF00FF41)),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CitySelectionScreen()),
              );
              _calculateCityTime();
            },
          ),
        ],
      ),
      body: Center(
        child: _error != null
            ? Text(_error!,
                style: TextStyle(color: Colors.red, fontFamily: 'RobotoMono'))
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(city.name,
                      style: TextStyle(
                        fontSize: 32,
                        color: Color(0xFF00FF41),
                        fontFamily: 'RobotoMono',
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: 16),
                  Text(_time ?? '--:--:--',
                      style: TextStyle(
                        fontSize: 56,
                        color: Color(0xFF00FF41),
                        fontFamily: 'RobotoMono',
                        letterSpacing: 2,
                      )),
                  SizedBox(height: 16),
                  Text(
                      'Time difference: ${_hourDiff != null && _hourDiff! >= 0 ? '+' : ''}${_hourDiff ?? '--'} hours',
                      style: TextStyle(
                        color: Color(0xFF00FF41),
                        fontFamily: 'RobotoMono',
                        fontSize: 18,
                      )),
                  SizedBox(height: 32),
                  Text('Timezone: ${city.timezone}',
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'RobotoMono',
                        fontSize: 14,
                      )),
                ],
              ),
      ),
    );
  }
}
