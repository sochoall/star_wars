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
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    final lista =
        context.select((PersonajePageChangeNotifier b) => b.personaje);
    final finalizo =
        context.select((PersonajePageChangeNotifier b) => b.finalizo);

    return SafeArea(
      top: true,
      bottom: true,
      child: Column(
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.search),
              title: TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  hintText: 'Filtrar por Género',
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  context
                      .read<PersonajePageChangeNotifier>()
                      .filtrarLista(value);
                },
              ),
              trailing: IconButton(
                icon: const Icon(Icons.cancel),
                onPressed: () {
                  _textController.clear();
                  context.read<PersonajePageChangeNotifier>().filtrarLista('');
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: ListView.builder(
                controller: _scrollController,
                key: const ValueKey('personaje_pagina_lista_key'),
                itemCount: finalizo ? lista.length : lista.length + 1,
                itemBuilder: (context, index) {
                  if (index >= lista.length) {
                    return !finalizo
                        ? const PersonajeItemLoading()
                        : const SizedBox();
                  }
                  return Column(children: [
                    PersonajeInfoDetalles(personaje: lista[index]),
                  ]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<PersonajePageChangeNotifier>().siguientePagina();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) {
      return false;
    }
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= maxScroll;
  }
}
