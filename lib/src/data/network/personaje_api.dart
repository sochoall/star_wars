import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:star_wars/src/data/dto/persona_dto.dart';

abstract class Api {
  Future<List<PersonajeDto>> getPersonajes();
}

class PersonajeApi implements Api {
  @override
  Future<List<PersonajeDto>> getPersonajes() async {
    final response = await http
        .get(Uri.parse('https://swapi.dev/api/people/?page=2&format=json'));
    final Map personajes = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return (personajes["results"] as List)
          .map((e) => PersonajeDto.fromMap(e))
          .toList();
    } else {
      throw Exception('Failed to fetch data. Please try again later.');
    }
  }
}
