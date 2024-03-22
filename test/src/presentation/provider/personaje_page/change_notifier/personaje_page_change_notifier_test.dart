import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:star_wars/src/presentation/provider/personajes_page/change_notifier/personaje_change_notifier.dart';

import '../../../../dumb_list.dart';
import '../../../../provider_mock.dart';

void main() {
  group('PersonajeChangeNotifier', () {
    late GetPersonajesMock getPersonajesMock;
    late PersonajePageChangeNotifier personajeChangeNotifier;

    setUp(() {
      getPersonajesMock = GetPersonajesMock();
    });

    test('la pagina se actualiza correctamente', () async {
      personajeChangeNotifier = PersonajePageChangeNotifier(
        getPersonajes: getPersonajesMock,
      );

      when(() => getPersonajesMock.call(pagina: any(named: 'pagina')))
          .thenAnswer((_) async => [...lista1, ...lista2]);

      // Set up the initial state
      expect(
        personajeChangeNotifier.estado,
        equals(EstadoPaginaPersonajes.inicio),
      );

      // Set up the response from getAllCharacters
      final pagina = personajeChangeNotifier.paginaActual;

      await personajeChangeNotifier.siguientePagina();

      // Verify that the state is updated correctly
      expect(
        personajeChangeNotifier.estado,
        equals(EstadoPaginaPersonajes.exito),
      );
      expect(personajeChangeNotifier.paginaActual, equals(pagina + 1));
      expect(
        personajeChangeNotifier.personaje,
        equals([
          ...[...lista1, ...lista2],
        ]),
      );
      expect(personajeChangeNotifier.finalizo, equals(false));
    });

    test('La pagina no se actualiza cuando llega al final', () async {
      // Set up the initial state with hasReachedEnd = true
      personajeChangeNotifier = PersonajePageChangeNotifier(
        getPersonajes: getPersonajesMock,
      );

      when(() => getPersonajesMock.call(pagina: any(named: 'pagina')))
          .thenAnswer((_) async => []);

      // Call the fetchNextPage method
      await personajeChangeNotifier.siguientePagina();

      // Verify that the state remains unchanged
      expect(
        personajeChangeNotifier.estado,
        equals(EstadoPaginaPersonajes.exito),
      );
      expect(personajeChangeNotifier.paginaActual, equals(2));
      expect(personajeChangeNotifier.personaje, isEmpty);
      expect(personajeChangeNotifier.finalizo, equals(true));
    });
  });
}
