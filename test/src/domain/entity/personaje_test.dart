import 'package:star_wars/src/domain/entity/personaje.dart';
import 'package:test/test.dart';

void main() {
  group('Personaje', () {
    test('Personajes con los mismos atributos deben ser iguales', () {
      final per1 = Personaje(
        name: 'Luke Skywalker',
        gender: 'male',
        height: '172',
      );

      final per2 = Personaje(
        name: 'Luke Skywalker',
        gender: 'male',
        height: '172',
      );

      expect(per1, equals(per2));
    });

    test('Personajes con diferentes atributos no deben ser iguales', () {
      final pers1 = Personaje(
        name: 'Luke Skywalker',
        gender: 'male',
        height: '172',
      );

      final pers2 = Personaje(
        name: 'C-3PO',
        gender: 'n/a',
        height: '167',
      );

      expect(pers1, isNot(equals(pers2)));
    });
  });
}
