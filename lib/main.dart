import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class SimulacaoClimatica extends StatefulWidget {
  @override
  _SimulacaoClimaticaState createState() => _SimulacaoClimaticaState();
}

class _SimulacaoClimaticaState extends State<SimulacaoClimatica> {
  String resultado = '';

  void executarSimulacao() {
    final n = 10000;
    final dias = 365;
    final baseTemperature = 20.0;
    final basePressure = 1000.0;
    final baseHumidity = 0.5;
    final temperatureVariation = 10.0;
    final pressureVariation = 50.0;
    final humidityVariation = 0.2;

    List<List<double>> weatherData = [];

    for (int i = 0; i < dias; i++) {
      List<double> dayData = [];

      for (int j = 0; j < n; j++) {
        double temperature = baseTemperature +
            (Random().nextDouble() * 2 - 1) * temperatureVariation;
        double pressure = basePressure +
            (Random().nextDouble() * 2 - 1) * pressureVariation;
        double humidity =
            baseHumidity + (Random().nextDouble() * 2 - 1) * humidityVariation;

        double heatIndex = -42.379 +
            2.04901523 * temperature +
            10.14333127 * humidity -
            0.22475541 * temperature * humidity -
            6.83783 * pow(10, -3) * pow(temperature, 2) -
            5.481717 * pow(10, -2) * pow(humidity, 2) +
            1.22874 * pow(10, -3) * pow(temperature, 2) * humidity +
            8.5282 * pow(10, -4) * temperature * pow(humidity, 2) -
            1.99 * pow(10, -6) * pow(temperature, 2) * pow(humidity, 2);

        dayData.add(heatIndex);
      }

      weatherData.add(dayData);
    }

    setState(() {
      resultado =
          'Dados climáticos simulados para $dias dias e $n locais:\n$weatherData';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simulação Climática em Flutter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Pressione o botão para executar a simulação:',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: executarSimulacao,
                child: Text('Executar Simulação'),
              ),
              SizedBox(height: 20),
              Text(
                resultado,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simulação Climática em Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SimulacaoClimatica(),
    );
  }
}