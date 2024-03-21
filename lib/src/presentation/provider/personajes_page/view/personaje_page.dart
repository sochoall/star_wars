import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:star_wars/src/domain/usecase/get_personajes.dart';
import 'package:star_wars/src/presentation/widgets/personaje_info_detalles.dart';
import 'package:star_wars/src/presentation/widgets/personaje_item_loading.dart';
import 'package:star_wars/src/presentation/provider/personajes_page/change_notifier/personaje_change_notifier.dart';

class PersonajePage extends StatelessWidget {
  const PersonajePage({super.key});

  @override
  Widget build(BuildContext context) {
    final useCase = context.read<GetPersonajes>();
    return ChangeNotifierProvider(
      create: (context) => PersonajePageChangeNotifier(getPersonajes: useCase),
      child: const PersonajeView(),
    );
  }
}

class PersonajeView extends StatefulWidget {
  const PersonajeView({super.key});

  @override
  State<PersonajeView> createState() => _PersonajeViewState();
}

class _PersonajeViewState extends State<PersonajeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PersonajePageChangeNotifier>().siguientePagina();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const _Content();
  }
}

class _Content extends StatefulWidget {
  const _Content({super.key});

  @override
  State<_Content> createState() => __ContentState();
}

class __ContentState extends State<_Content> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final lista =
        context.select((PersonajePageChangeNotifier b) => b.personaje);

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: ListView.builder(
        key: const ValueKey('personaje_pagina_lista_key'),
        controller: _scrollController,
        itemCount: lista.length,
        itemBuilder: (context, index) {
          if (index >= lista.length) {
            return const PersonajeItemLoading();
          }
          return Column(children: [
            PersonajeInfoDetalles(personaje: lista[index]),
          ]);
        },
      ),
    );
  }
}
