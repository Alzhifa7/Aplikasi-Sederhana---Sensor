import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sensor_jmp1/home_page.dart';

class SensorMouse extends StatefulWidget {
  const SensorMouse({super.key});

  @override
  SensorMouseState createState() => SensorMouseState();
}

class SensorMouseState extends State<SensorMouse> {
  Offset posisiMouse = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sensor Mouse'),
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
        child: MouseRegion(
          onEnter: (PointerEnterEvent event) {
            setState(() {
              posisiMouse = event.position;
            });
          },
          onExit: (PointerExitEvent event) {
            setState(() {
              posisiMouse = Offset.zero;
            });
          },
          onHover: (PointerHoverEvent event) {
            setState(() {
              posisiMouse = event.position;
            });
          },
          child: Container(
            color: Colors.grey[200],
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Text(
                'Posisi Mouse: x=${posisiMouse.dx.toStringAsFixed(2)}, y=${posisiMouse.dy.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
