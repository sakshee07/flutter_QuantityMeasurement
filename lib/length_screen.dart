import 'package:flutter/material.dart';

class LengthScreen extends StatefulWidget {
  const LengthScreen({Key? key}) : super(key: key);

  @override
  State<LengthScreen> createState() => _LengthScreenState();
}

class _LengthScreenState extends State<LengthScreen> {
  final value = <String, double>{
    'Centimeter_Centimeter': 1,
    'Centimeter_Kilometer': 0.00001,
    'Centimeter_MiliMeter': 10,
    'MiliMeter_Centimeter': 0.1,
    'MiliMeter_Kilometer': 0.000001,
    'MiliMeter_MiliMeter': 1,
    'Kilometer_Centimeter': 100000,
    'Kilometer_Kilometer': 1,
    'Kilometer_MiliMeter': 1000000,
  };

  final List<String> quantities = ['Centimeter', 'MiliMeter', 'Kilometer'];
  final List<String> selectedQuantities = [
    'Kilometer',
    'Centimeter',
    'MiliMeter',
  ];
  String convertFrom = 'Centimeter';
  String convertTo = 'MiliMeter';

  final TextEditingController valueController = TextEditingController();

  String result = "Result";
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
    // double.parse(valueController.text);
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
      backgroundColor: Colors.green[200],
      body: SafeArea(
        // child: Expanded(
        child: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Padding(
                padding: EdgeInsets.all(40.0),
                // child: Expanded(
                child: Text(
                  'Enter Length',
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
                    prefixIcon: Icon(Icons.input_outlined),
                    // suffixIcon: IconButton(
                    //    icon: Icons(Icons.close),
                    //   onPressed: () => valueController.clear(),),
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
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
