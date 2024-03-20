import 'package:star_wars/src/domain/entity/personaje.dart';

abstract class PersonajeRepository {
  Future<List<Personaje>> getPersonajes();
}
