import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:star_wars/src/domain/usecase/get_personajes.dart';
import 'package:star_wars/src/presentation/provider/personajes_page/view/personaje_page.dart';

class ProviderRoot extends StatelessWidget {
  const ProviderRoot({super.key, required this.getPersonaje});

  final GetPersonajes getPersonaje;

  @override
  Widget build(BuildContext context) {
    // - Provides UseCases down to the widget tree using Bloc's D.I widget
    // - Later we'll use it to instantiate each Controller (if needed)
    return MultiProvider(
      providers: [
        Provider.value(value: getPersonaje),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return const PersonajePage();
  }
}
