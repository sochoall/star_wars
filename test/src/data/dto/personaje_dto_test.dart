import 'package:star_wars/src/data/dto/persona_dto.dart';
import 'package:test/test.dart';

void main() {
  group('PersonajeDto', () {
    late String referenceFormatoJson;
    late PersonajeDto referenceDto;

    setUp(() {
      referenceDto = PersonajeDto(
        name: "Luke Skywalker",
        height: "172",
        mass: "77",
        hair_color: "blond",
        skin_color: "fair",
        eye_color: "blue",
        birth_year: "19BBY",
        gender: "male",
        films: [
          "https://swapi.dev/api/films/2/",
          "https://swapi.dev/api/films/6/",
          "https://swapi.dev/api/films/3/",
          "https://swapi.dev/api/films/1/",
          "https://swapi.dev/api/films/7/"
        ],
      );

      referenceFormatoJson = referenceDto.toJsonFormat();
    });

    test('La instancia PersonajeDto debe ser creada desde JSON', () {
      final createdDto = PersonajeDto.fromJsonFormat(referenceFormatoJson);
      final json = createdDto.toJsonFormat();
      expect(createdDto, referenceDto);
      expect(json, referenceFormatoJson);
    });
  });
}
