import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:star_wars/src/domain/usecase/get_personajes.dart';
import 'package:star_wars/src/presentation/provider/personajes_page/view/personaje_page.dart';
import 'package:star_wars/src/presentation/provider/cubo_page/view/cubo_page.dart';
import 'package:star_wars/src/presentation/provider/cubo_page/change_notifier/cubo_change_notifier.dart';

class ProviderRoot extends StatelessWidget {
  const ProviderRoot({super.key, required this.getPersonaje});

  final GetPersonajes getPersonaje;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: getPersonaje),
        ChangeNotifierProvider(
          create: (context) => CuboChangeNotifier(),
        )
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const SizedBox(
            height: 30,
            child: CuboPage(),
          ),
        ),
        body: const PersonajePage(),
      ),
    );
  }
}
