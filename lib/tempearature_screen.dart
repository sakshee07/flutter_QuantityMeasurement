import 'package:flutter/material.dart';

class TempeartureScreen extends StatefulWidget {
  const TempeartureScreen({Key? key}) : super(key: key);

  @override
  State<TempeartureScreen> createState() => _TempeartureScreenState();
}

class _TempeartureScreenState extends State<TempeartureScreen> {
  final List<String> quantities = [
    'Celsius',
    'Fahrenheit',
    'Kelvin',
    'Rankine'
  ];
  final List<String> selectedQuantities = [
    'Celsius',
    'Fahrenheit',
    'Kelvin',
    'Rankine'
  ];
  String convertFrom = 'Celsius';
  String convertTo = 'Rankine';
  String finalResult = "Result";
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
    var enterdValue = double.parse(valueController.text);
    if (convertFrom == 'Celsius' && convertTo == 'Celsius') {
      var result = (enterdValue * 1);
      finalResult = result.toString();
    } else if (convertFrom == 'Celsius' && convertTo == 'Fahrenheit') {
      var result = (enterdValue * 1.8) + 32;

      finalResult = result.toString();
    } else if (convertFrom == 'Celsius' && convertTo == 'Kelvin') {
      var result = enterdValue + 273.5;

      finalResult = result.toString();
    } else if (convertFrom == 'Celsius' && convertTo == 'Rankine') {
      var result = (enterdValue * 1.8) + 491.67;

      finalResult = result.toString();
    } else if (convertFrom == 'Fahrenheit' && convertTo == 'Celsius') {
      var result = (enterdValue - 32) * 5 / 9;

      finalResult = result.toString();
    } else if (convertFrom == 'Fahrenheit' && convertTo == 'Fahrenheit') {
      var result = (enterdValue * 1);

      finalResult = result.toString();
    } else if (convertFrom == 'Fahrenheit' && convertTo == 'Kelvin') {
      var result = (enterdValue - 32) * 5 / 273.15;

      finalResult = result.toString();
    } else if (convertFrom == 'Fahrenheit' && convertTo == 'Rankine') {
      var result = enterdValue + 459.67;

      finalResult = result.toString();
    } else if (convertFrom == 'Kelvin' && convertTo == 'Celsius') {
      var result = (enterdValue - 273.1);
      finalResult = result.toString();
    } else if (convertFrom == 'Kelvin' && convertTo == 'Fahrenheit') {
      var result = (enterdValue * 1.8) + 32;

      finalResult = result.toString();
    } else if (convertFrom == 'Kelvin' && convertTo == 'Kelvin') {
      var result = enterdValue * 1;
      finalResult = result.toString();
    } else if (convertFrom == 'Kelvin' && convertTo == 'Rankine') {
      var result = (enterdValue * 1.8);
      finalResult = result.toString();
    } else if (convertFrom == 'Rankine' && convertTo == 'Celsius') {
      var result = (enterdValue - 149.67) * 5 / 9;
      finalResult = result.toString();
    } else if (convertFrom == 'Rankine' && convertTo == 'Fahrenheit') {
      var result = (enterdValue - 459.7);
      finalResult = result.toString();
    } else if (convertFrom == 'Rankine' && convertTo == 'Kelvin') {
      var result = (enterdValue * 5 / 9);
      finalResult = result.toString();
    } else if (convertFrom == 'Rankine' && convertTo == 'Rankine') {
      var result = enterdValue * 1;
      finalResult = result.toString();
    }
    setState(() {
      finalResult = finalResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(40.0),
                  child: Text(
                    'Enter Temperature',
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
                    finalResult,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    //  );
  }
}
