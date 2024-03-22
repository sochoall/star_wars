import 'package:flutter/material.dart';

class PersonajeItemLoading extends StatelessWidget {
  const PersonajeItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 80,
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
