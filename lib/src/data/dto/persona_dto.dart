import 'dart:convert';

import 'package:star_wars/src/domain/entity/personaje.dart';

//Datos generales del personaje
class PersonajeDto extends Personaje {
  PersonajeDto({
    super.name,
    super.birth_year,
    super.eye_color,
    super.gender,
    super.hair_color,
    super.height,
    super.mass,
    super.skin_color,
    super.films,
  });

//Convertimos de JSON a MAP
  factory PersonajeDto.fromJsonFormat(String arg) =>
      PersonajeDto.fromMap(json.decode(arg));

  String toJsonFormat() => json.encode(toMap());

//Mapeamos la informacion despues de decodificar
  factory PersonajeDto.fromMap(Map<String, dynamic> json) => PersonajeDto(
        name: json["name"],
        birth_year: json["birth_year"] == 'unknown'
            ? 'desconocido'
            : json["birth_year"],
        eye_color: json["eye_color"],
        gender: json['gender'] == 'male'
            ? 'masculino'
            : json['gender'] == 'female'
                ? 'femenino'
                : 'sin datos',
        hair_color: json["hair_color"],
        height: json["height"],
        mass: json["mass"],
        skin_color: json["skin_color"],
        films: json['films'] == null
            ? []
            : List<String>.from(json['films']!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'birth_year': birth_year,
        'eye_color': eye_color,
        'gender': gender,
        'hair_color': hair_color,
        'height': height,
        'mass': mass,
        'skin_color': skin_color,
        'films': films == null ? [] : List<dynamic>.from(films!.map((x) => x)),
      };
}
