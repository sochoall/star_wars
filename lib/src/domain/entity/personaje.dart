class Personaje {
  Personaje({
    this.name,
    this.height,
    this.mass,
    this.hair_color,
    this.skin_color,
    this.eye_color,
    this.birth_year,
    this.gender,
    this.films,
  });

  final String? name;
  final String? height;
  final String? mass;
  final String? hair_color;
  final String? skin_color;
  final String? eye_color;
  final String? birth_year;
  final String? gender;
  final List? films;

  @override
  List<Object?> get props => [
        name,
        height,
        mass,
        hair_color,
        gender,
        skin_color,
        birth_year,
        gender,
        films,
      ];
}
