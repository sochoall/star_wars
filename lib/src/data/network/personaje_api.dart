import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:star_wars/src/data/dto/persona_dto.dart';

abstract class Api {
  Future<List<PersonajeDto>> getPersonajes({int pagina = 1});
}

class PersonajeApi implements Api {
  @override
  Future<List<PersonajeDto>> getPersonajes({int pagina = 1}) async {
    final response =
        await http.get(Uri.parse('https://swapi.dev/api/people/?page=$pagina'));
    final Map personajes = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return (personajes["results"] as List)
          .map((e) => PersonajeDto.fromMap(e))
          .toList();
    } else if (response.statusCode == 404) {
      return [];
    } else {
      throw Exception('Failed to fetch data. Please try again later.');
    }
  }
}
