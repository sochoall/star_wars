import 'dart:math';
import 'package:flutter/material.dart';

import 'package:star_wars/src/presentation/provider/cubo_page/view/cubo_page.dart';

class Cubo extends StatelessWidget {
  const Cubo(
      {Key? key,
      required this.x,
      required this.y,
      required this.color,
      required this.size,
      this.rainbow = false})
      : super(key: key);

  static const double _shadow = 0.2, _halfPi = pi / 2, _oneHalfPi = pi + pi / 2;

  final double x, y, size;
  final Color color;
  final bool rainbow;

  double get _sum => (y + (x > pi ? pi : 0.0)).abs() % (pi * 2);

  @override
  Widget build(BuildContext context) {
    final bool topBottom = x < _halfPi || x > _oneHalfPi;
    final bool northSouth = _sum < _halfPi || _sum > _oneHalfPi;
    final bool eastWest = _sum < pi;

    return Stack(children: <Widget>[
      _side(zRot: y, xRot: -x, shadow: _getShadow(x), moveZ: topBottom),
      _side(
          yRot: y,
          xRot: _halfPi - x,
          shadow: _getShadow(_sum),
          moveZ: northSouth),
      _side(
          yRot: -_halfPi + y,
          xRot: _halfPi - x,
          shadow: _shadow - _getShadow(_sum),
          moveZ: eastWest)
    ]);
  }

  double _getShadow(num r) {
    if (r < _halfPi) {
      return map(r, 0, _halfPi, 0, _shadow) as double;
    } else if (r > _oneHalfPi) {
      return _shadow - map(r, _oneHalfPi, pi * 2, 0, _shadow);
    } else if (r < pi) {
      return _shadow - map(r, _halfPi, pi, 0, _shadow);
    }

    return map(r, pi, _oneHalfPi, 0, _shadow) as double;
  }

  Widget _side(
      {bool moveZ = true,
      double xRot = 0.0,
      double yRot = 0.0,
      double zRot = 0.0,
      double shadow = 0.0}) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..rotateX(xRot)
        ..rotateY(yRot)
        ..rotateZ(zRot)
        ..translate(0.0, 0.0, moveZ ? -size / 2 : size / 2),
      child: Container(
        alignment: Alignment.center,
        child: Container(
          constraints: BoxConstraints.expand(width: size, height: size),
          color: color,
          foregroundDecoration: BoxDecoration(
            color: Colors.black.withOpacity(rainbow ? 0.0 : shadow),
            border: Border.all(
                width: 0.8,
                color: rainbow ? color.withOpacity(0.3) : Colors.black26),
          ),
        ),
      ),
    );
  }
}
