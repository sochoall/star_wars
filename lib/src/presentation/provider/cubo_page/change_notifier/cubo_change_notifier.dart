import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CuboChangeNotifier extends ChangeNotifier {
  double xcoords = pi * 0.25, ycoords = pi * 0.25;

//GYROSCOPIO
  static const methodChannel = MethodChannel('com.example.star_wars/method');
  static const gyroscopeChannel =
      EventChannel('com.example.star_wars/gyroscope');

  leerGiroscopio() async {
    gyroscopeChannel.receiveBroadcastStream().listen((event) {
      var valoresGyroscopio = List.from(event);

      xcoords = (xcoords + (-valoresGyroscopio[0]) / 10) % (pi * 2);
      ycoords = (ycoords + (-valoresGyroscopio[1]) / 10) % (pi * 2);
      notifyListeners();
    });
  }
}
