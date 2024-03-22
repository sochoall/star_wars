import 'package:mocktail/mocktail.dart';
import 'package:star_wars/src/data/personaje_api_impl.dart';
import 'package:star_wars/src/data/network/personaje_api.dart';
import 'package:test/test.dart';
import '../dumb_list.dart';

class MockApi extends Mock implements Api {}

class MockLocalStorage extends Mock {}

void main() {
  late PersonajeApiImplementation personajeApiImpl;
  late MockApi mockApi;

  setUp(() {
    mockApi = MockApi();
    personajeApiImpl = PersonajeApiImplementation(api: mockApi);
  });
  test('Retorna los personajes obtenidos hasta el momento', () async {
    const pagina = 0;
    final cachedCharacters = lista1;

    final result = await personajeApiImpl.getPersonajes(pagina: pagina);

    expect(result, equals(cachedCharacters));

    verifyZeroInteractions(mockApi);
  });
}
