import 'package:flutter/material.dart';

import 'package:star_wars/src/data/network/personaje_api.dart';
import 'package:star_wars/src/data/personaje_api_impl.dart';
import 'package:star_wars/src/domain/usecase/get_personajes.dart';
import 'package:star_wars/src/presentation/provider/provider_root.dart';

class ListRoot extends StatefulWidget {
  const ListRoot({super.key});

  @override
  State<ListRoot> createState() => _ListRootState();
}

class _ListRootState extends State<ListRoot> {
  late GetPersonajes _getPersonajes;

  @override
  void initState() {
    super.initState();

    final api = PersonajeApi();
    final repo = PersonajeApiImplementation(api: api);

    _getPersonajes = GetPersonajes(repository: repo);
  }

  @override
  Widget build(BuildContext context) {
    return ProviderRoot(getPersonaje: _getPersonajes);
  }
}
