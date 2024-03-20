import 'dart:convert';

import 'package:star_wars/src/domain/entity/personaje.dart';

class PersonajeDto extends Personaje {
  PersonajeDto(
      {super.name,
      super.birthYear,
      super.eyeColor,
      super.gender,
      super.hairColor,
      super.height,
      super.mass,
      super.skinColor});

  factory PersonajeDto.fromJsonFormat(String arg) =>
      PersonajeDto.fromMap(json.decode(arg));

  String toJsonFormat() => json.encode(toMap());

  factory PersonajeDto.fromMap(Map<String, String> json) => PersonajeDto(
      name: json["name"],
      birthYear: json["birthYear"],
      eyeColor: json["eyeColor"],
      gender: json["gender"],
      hairColor: json["hairColor"],
      height: json["height"],
      mass: json["mass"],
      skinColor: json["skinColor"]);

  Map<String, dynamic> toMap() => {
        'name': name,
        'birthYear': birthYear,
        'eyeColor': eyeColor,
        'gender': gender,
        'hairColor': hairColor,
        'height': height,
        'mass': mass,
        'skinColor': skinColor
      };
}
