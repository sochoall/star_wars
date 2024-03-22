import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:provider/provider.dart';
import 'package:star_wars/src/domain/usecase/get_personajes.dart';

class GetPersonajesMock extends Mock implements GetPersonajes {}

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget, {
    MockNavigator? navigator,
    GetPersonajes? getPersonajes,
  }) {
    final innerChild = Scaffold(
      body: widget,
    );

    return pumpWidget(
      MultiProvider(
        providers: [
          Provider.value(
            value: getPersonajes ?? GetPersonajesMock(),
          ),
        ],
        child: MaterialApp(
          home: navigator == null
              ? innerChild
              : MockNavigatorProvider(
                  navigator: navigator,
                  child: innerChild,
                ),
        ),
      ),
    );
  }
}
