import 'package:flutter/material.dart';

import 'package:star_wars/src/domain/entity/personaje.dart';

class PersonajeInfoDetalles extends StatelessWidget {
  const PersonajeInfoDetalles({
    super.key,
    required this.personaje,
  });

  final Personaje personaje;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Column(
      children: [
        Card(
          elevation: 0,
          color: cs.tertiaryContainer,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 4),
                child: Center(
                  child: Text("Detalles del Peronaje"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(child: Icon(Icons.photo)),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'Nombre : ${personaje.name ?? ''}',
                                    style: tt.titleSmall!.copyWith(
                                      color: cs.onSurfaceVariant,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Género: ${personaje.gender ?? ''}',
                                    style: tt.titleMedium!.copyWith(
                                      color: personaje.gender == 'male'
                                          ? Colors.lightGreen
                                          : Colors.redAccent,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  const Divider(
                                    height: 1,
                                    color: Colors.amber,
                                    thickness: 0.5,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              'Películas:',
                              style: tt.bodyLarge!.copyWith(
                                color: cs.onSurfaceVariant,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: personaje.films?.length ?? 0,
                              itemBuilder: (context, index) {
                                final film = personaje.films![index];
                                final nombre = film.split('/')[5];
                                return Padding(
                                  padding:
                                      const EdgeInsets.only(left: 12.0, top: 8),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(16),
                                      ),
                                      color: cs.surfaceVariant,
                                    ),
                                    height: 80,
                                    width: 80,
                                    child: Center(
                                      child: Text(
                                        nombre,
                                        style: tt.bodyLarge!.copyWith(
                                          color: cs.onSurfaceVariant,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Divider(
            height: 1,
            color: cs.tertiaryContainer,
          ),
        ),
      ],
    );
  }
}
