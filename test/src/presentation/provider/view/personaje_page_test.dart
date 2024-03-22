import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:star_wars/src/presentation/provider/personajes_page/view/personaje_page.dart';
import 'package:star_wars/src/presentation/widgets/personaje_info_detalles.dart';

import '../../../dumb_list.dart';
import '../../../provider_mock.dart';

void main() {
  group('PersonajePage', () {
    late GetPersonajesMock getPersonajesMock;

    setUp(() async {
      getPersonajesMock = GetPersonajesMock();
      when(() => getPersonajesMock.call(pagina: any(named: 'pagina')))
          .thenAnswer((_) async => [...lista1, ...lista2]);
    });

    testWidgets('render de PersonajeView', (tester) async {
      await tester.pumpApp(
        const PersonajePage(),
        getPersonajes: getPersonajesMock,
      );

      expect(find.byType(PersonajeView), findsOneWidget);
    });

    testWidgets('Render del widget de Personajes', (tester) async {
      const key = Key('personaje_pagina_lista_key');

      try {
        await tester.pumpApp(
          const PersonajePage(),
          getPersonajes: getPersonajesMock,
        );

        await tester.pumpAndSettle();
      } catch (e) {
        // ignore loading at the bottom
      }

      expect(find.byKey(key), findsOneWidget);
      expectLater(
        find.byType(PersonajeInfoDetalles),
        findsNWidgets([...lista1, ...lista2].length),
      );
    });
  });
}
