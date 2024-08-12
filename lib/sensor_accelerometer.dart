import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:sensor_jmp1/home_page.dart';

class SensorAccelerometer extends StatefulWidget {
  const SensorAccelerometer({super.key});

  @override
  SensorAccelerometerState createState() => SensorAccelerometerState();
}

class SensorAccelerometerState extends State<SensorAccelerometer> {
  double x = 0.0, y = 0.0, z = 0.0;
  late StreamSubscription<AccelerometerEvent> subscription;

  @override
  void initState() {
    super.initState();
    // Listen to accelerometer events using the correct syntax
    // ignore: deprecated_member_use
    subscription = accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        x = event.x;
        y = event.y;
        z = event.z;
      });
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sensor Accelerometer'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const HomePage()),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Accelerometer values:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Text('X: ${x.toStringAsFixed(2)}'),
            Text('Y: ${y.toStringAsFixed(2)}'),
            Text('Z: ${z.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
