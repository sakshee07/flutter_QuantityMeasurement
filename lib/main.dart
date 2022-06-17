import 'package:flutter/material.dart';
import 'package:quantity_measurement/length_screen.dart';
import 'package:quantity_measurement/tempearature_screen.dart';
import 'package:quantity_measurement/volume_screen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final screens = [
    const LengthScreen(),
    const TempeartureScreen(),
    const VolumeScreen()
  ];
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black54,
          centerTitle: true,
          title: const Text(
            'Quantity Converter',
            style: TextStyle(
              fontSize: 35,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black54,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            currentIndex: currentIndex,
            onTap: (index) => setState(() => currentIndex = index),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.height),
                label: 'Length',
              ),
              BottomNavigationBarItem(
                icon: Icon(MdiIcons.thermometer),
                label: 'Temperature',
              ),
              BottomNavigationBarItem(
                icon: Icon(MdiIcons.cup),
                label: 'Volume',
              ),
            ]),
      ),
    );
  }
}
