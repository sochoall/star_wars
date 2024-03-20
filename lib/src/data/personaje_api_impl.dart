import 'package:star_wars/src/domain/repositories/personaje_respository.dart';
import 'package:star_wars/src/data/network/personaje_api.dart';
import 'package:star_wars/src/domain/entity/personaje.dart';

class PersonajeApiImplementation implements PersonajeRepository {
  final Api _api;

  PersonajeApiImplementation({required Api api}) : _api = api;

  @override
  Future<List<Personaje>> getPersonajes() async {
    final listaObtenida = await _api.getPersonajes();
    return listaObtenida;
  }
}
