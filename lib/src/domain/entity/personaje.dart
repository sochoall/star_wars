class Personaje {
  Personaje({
    this.name,
    this.height,
    this.mass,
    this.hairColor,
    this.skinColor,
    this.eyeColor,
    this.birthYear,
    this.gender,
  });

  final String? name;
  final String? height;
  final String? mass;
  final String? hairColor;
  final String? skinColor;
  final String? eyeColor;
  final String? birthYear;
  final String? gender;

  @override
  List<Object?> get props => [
        name,
        height,
        mass,
        hairColor,
        gender,
        skinColor,
        birthYear,
        gender,
      ];
}
