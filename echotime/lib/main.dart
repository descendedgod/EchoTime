import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'providers/city_provider.dart';

void main() {
  runApp(EchotimeApp());
}

class EchotimeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CityProvider(),
      child: MaterialApp(
        title: 'Echotime World Clock',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Color(0xFF000000),
          primaryColor: Color(0xFF00FF41),
          colorScheme: ColorScheme.fromSwatch(
            brightness: Brightness.dark,
            primarySwatch: Colors.green,
            accentColor: Color(0xFF00FF41),
          ),
          textTheme: TextTheme(
            bodyLarge: TextStyle(
              color: Color(0xFF00FF41),
              fontFamily: 'RobotoMono',
            ),
            bodyMedium: TextStyle(
              color: Color(0xFF00FF41),
              fontFamily: 'RobotoMono',
            ),
            headlineMedium: TextStyle(
              color: Color(0xFF00FF41),
              fontFamily: 'RobotoMono',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
