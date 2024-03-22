import 'package:flutter/material.dart';

import 'package:star_wars/src/domain/entity/personaje.dart';
import 'package:star_wars/src/domain/usecase/get_personajes.dart';

enum EstadoPaginaPersonajes { inicio, cargando, exito, fallido }

class PersonajePageChangeNotifier with ChangeNotifier {
  PersonajePageChangeNotifier({
    required GetPersonajes getPersonajes,
    List<Personaje>? personaje,
    EstadoPaginaPersonajes? estadoInicial,
    int? paginaInicial,
    String? filtro,
  })  : _getPersonajes = getPersonajes,
        _personaje = personaje ?? [],
        _estado = estadoInicial ?? EstadoPaginaPersonajes.inicio,
        _paginaActual = paginaInicial ?? 1,
        _filtro = filtro ?? '';

  //Casos de Uso
  final GetPersonajes _getPersonajes;
  String _filtro;

  EstadoPaginaPersonajes _estado;
  EstadoPaginaPersonajes get estado => _estado;

  //Llenamos la lista con los personajes y agregamos la condicion para filtrar
  //la busqueda por genero
  final List<Personaje> _personaje;
  List<Personaje> get personaje => _filtro.isEmpty
      ? List.unmodifiable(_personaje)
      : List.unmodifiable(_personaje.where(
          (personaje) => personaje.gender!.contains(_filtro.toLowerCase())));

  int _paginaActual;
  int get paginaActual => _paginaActual;

  var _finalizo = false;
  bool get finalizo => _finalizo;

  //Obtenemos los datos de los personajes
  Future<void> siguientePagina() async {
    if (_finalizo) return;

    _estado = EstadoPaginaPersonajes.cargando;
    notifyListeners();

    final lista = await _getPersonajes(pagina: _paginaActual);
    _paginaActual++;
    _personaje.addAll(lista);
    _estado = EstadoPaginaPersonajes.exito;
    _finalizo = lista.isEmpty;
    notifyListeners();
  }

  //filtramos por genero
  void filtrarLista(String filtro) {
    _filtro = filtro;
    notifyListeners();
  }
}
