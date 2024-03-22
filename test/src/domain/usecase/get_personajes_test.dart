import 'package:mocktail/mocktail.dart';
import 'package:star_wars/src/domain/entity/personaje.dart';
import 'package:star_wars/src/domain/repositories/personaje_respository.dart';
import 'package:star_wars/src/domain/usecase/get_personajes.dart';
import 'package:test/test.dart';

class MockPersonajeRepository extends Mock implements PersonajeRepository {}

void main() {
  late GetPersonajes getPersonajes;
  late MockPersonajeRepository mockPersonajeRepository;

  setUp(() {
    mockPersonajeRepository = MockPersonajeRepository();
    getPersonajes = GetPersonajes(repository: mockPersonajeRepository);
  });

  group('GetPersonajes', () {
    test('Debe retornar la lista de peronajes', () async {
      const pagina = 0;
      final personajes = [
        Personaje(name: 'Luck Skywalker'),
        Personaje(name: 'C-3PO'),
      ];

      when(() => mockPersonajeRepository.getPersonajes(pagina: pagina))
          .thenAnswer((_) async => personajes);

      final result = await getPersonajes.call(pagina: pagina);

      expect(result, equals(personajes));

      verify(() => mockPersonajeRepository.getPersonajes(pagina: pagina))
          .called(1);
      verifyNoMoreInteractions(mockPersonajeRepository);
    });
  });
}
