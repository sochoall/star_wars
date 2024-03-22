import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:star_wars/src/presentation/provider/cubo_page/view/cubo_page_first.dart';
import 'package:star_wars/src/presentation/provider/cubo_page/change_notifier/cubo_change_notifier.dart';

num map(num value,
        [num iStart = 0, num iEnd = pi * 2, num oStart = 0, num oEnd = 1.0]) =>
    ((oEnd - oStart) / (iEnd - iStart)) * (value - iStart) + oStart;

class CuboPage extends StatefulWidget {
  const CuboPage({super.key});

  @override
  State<CuboPage> createState() => _CuboPageState();
}

class _CuboPageState extends State<CuboPage> {
  final List<Widget> _list = <Widget>[];
  final double _size = 0.25;

  int get size => _list.length;
  late double prevX, prevY;

  @override
  Widget build(BuildContext context) {
    context.read<CuboChangeNotifier>().leerGiroscopio();
    return Stack(
      children: [
        LayoutBuilder(
          builder: (_, BoxConstraints c) => Stack(
            children: _list.map((Widget w) {
              final num i = map(size - _list.indexOf(w), 0, 150);
              return Positioned(
                  top: (c.maxHeight / 2 - _size / 2) + i * c.maxHeight * 0.9,
                  left: (c.maxWidth / 2 - _size / 2) - i * c.maxWidth * 0.9,
                  child: Transform.scale(scale: i * 1.5 + 1.0, child: w));
            }).toList(),
          ),
        ),
        Consumer<CuboChangeNotifier>(builder: (context, value, child) {
          return Cubo(
            color: Colors.grey.shade200,
            x: value.xcoords,
            y: value.ycoords,
            size: 25.0,
          );
        }),
      ],
    );
  }
}
