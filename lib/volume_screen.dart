import 'package:flutter/material.dart';

class VolumeScreen extends StatefulWidget {
  const VolumeScreen({Key? key}) : super(key: key);

  @override
  State<VolumeScreen> createState() => _VolumeScreenState();
}

class _VolumeScreenState extends State<VolumeScreen> {
  final value = <String, double>{
    'litre_millilitre': 1000,
    'litre_cubicMeter': 0.001,
    'litre_gallon': 0.264172,
    'litre_litre': 1,
    'millilitre_millilitre': 1,
    'millilitre_litre': 1000,
    'millilitre_cubicMeter': 0.000001,
    'millilitre_gallon': 0.000264,
    'gallon_millilitre': 4546.09,
    'gallon_litre': 3.785,
    'gallon_cubicMeter': 0.00454,
    'galon_galon': 1,
    'cubicMeter_cubicMeter': 1,
    'cubicMeter_litre': 0.001,
    'cubicMeter_gallon': 264.172,
    'cubicMeter_millilitre': 1000000
  };
  final List<String> quantities = [
    'litre',
    'millilitre',
    'cubicMeter',
    'gallon'
  ];

  final List<String> selectedQuantities = [
    'litre',
    'millilitre',
    'cubicMeter',
    'gallon'
  ];
  String convertFrom = 'litre';
  String convertTo = 'gallon';
  String result = "Result";
  final TextEditingController valueController = TextEditingController();
  @override
  void initState() {
    super.initState();
    valueController.addListener(() {
      setState(() {});
    });
  }

  convert() {
    print('Calculate value');
    print(convertFrom);
    print(convertTo);
    var key = "$convertFrom" "_" "$convertTo";
    var conversionFactor = value[key];
    var enterdValue = double.parse(valueController.text);
    double result = enterdValue * conversionFactor!;

    print(conversionFactor);
    print(key);
    setState(() {
      this.result = result.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(40.0),
                  child: Text(
                    'Enter Volume',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
                    controller: valueController,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Value',
                      hintText: 'Enter your value',
                    ),
                  ),
                ),
                const Text(
                  'From',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<String>(
                    value: convertFrom,
                    items: quantities.map((String quantities) {
                      return DropdownMenuItem<String>(
                        value: quantities,
                        child: Text(quantities),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        convertFrom = newValue!;
                      });
                    },
                  ),
                ),
                const Text(
                  'To',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: DropdownButton<String>(
                    //  borderRadius: BorderRadius.circular(15),
                    value: convertTo,
                    items: selectedQuantities.map((String selectedQuantities) {
                      return DropdownMenuItem<String>(
                        value: selectedQuantities,
                        child: Text(selectedQuantities),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        convertTo = newValue!;
                      });
                    },
                  ),
                ),
                TextButton(
                    onPressed: convert,
                    child: const Text(
                      'Convert',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        backgroundColor: Colors.grey,
                        color: Colors.black,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    result,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
