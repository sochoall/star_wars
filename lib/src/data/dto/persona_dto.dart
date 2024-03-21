import 'dart:convert';

import 'package:star_wars/src/domain/entity/personaje.dart';

//Datos generales del personaje
class PersonajeDto extends Personaje {
  PersonajeDto({
    super.name,
    super.birthYear,
    super.eyeColor,
    super.gender,
    super.hairColor,
    super.height,
    super.mass,
    super.skinColor,
    super.films,
  });

//Convertimos de JSON a MAP
  factory PersonajeDto.fromJsonFormat(String arg) =>
      PersonajeDto.fromMap(json.decode(arg));

  String toJsonFormat() => json.encode(toMap());

//Mapeamos la informacion despues de decodificar
  factory PersonajeDto.fromMap(Map<String, dynamic> json) => PersonajeDto(
        name: json["name"],
        birthYear: json["birth_year"],
        eyeColor: json["eye_color"],
        gender: json['gender'] == 'male'
            ? 'masculino'
            : json['gender'] == 'female'
                ? 'femenino'
                : 'sin datos',
        hairColor: json["hair_color"],
        height: json["height"],
        mass: json["mass"],
        skinColor: json["skin_color"],
        films: json['films'] == null
            ? []
            : List<String>.from(json['films']!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'birth_year': birthYear,
        'eye_color': eyeColor,
        'gender': gender,
        'hair_color': hairColor,
        'height': height,
        'mass': mass,
        'skin_color': skinColor,
        'films': films == null ? [] : List<dynamic>.from(films!.map((x) => x)),
      };
}
