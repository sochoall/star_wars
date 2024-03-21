import 'package:flutter/material.dart';
import 'package:star_wars/src/domain/entity/personaje.dart';
import 'package:star_wars/src/domain/usecase/get_personajes.dart';

class PersonajePageChangeNotifier with ChangeNotifier {
  PersonajePageChangeNotifier({
    required GetPersonajes getPersonajes,
    List<Personaje>? personaje,
  })  : _getPersonajes = getPersonajes,
        _personaje = personaje ?? [];

  //Casos de Uso
  final GetPersonajes _getPersonajes;

  //Propiedades
  final List<Personaje> _personaje;
  List<Personaje> get personaje => List.unmodifiable(_personaje);

  //Obtener los datos de la siguiente pagina
  Future<void> siguientePagina() async {
    final lista = await _getPersonajes();
    _personaje.addAll(lista);
    notifyListeners();
  }
}
