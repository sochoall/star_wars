import 'package:star_wars/src/domain/entity/personaje.dart';
import 'package:star_wars/src/domain/repositories/personaje_respository.dart';

class GetPersonajes {
  GetPersonajes({required PersonajeRepository repository})
      : _repository = repository;

  final PersonajeRepository _repository;

  Future<List<Personaje>> obtener() async {
    final lista = await _repository.getPersonajes();
    return lista;
  }
}
