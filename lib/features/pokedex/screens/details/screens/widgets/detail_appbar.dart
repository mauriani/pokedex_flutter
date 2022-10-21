import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';

class DetailAppBarWidget extends StatelessWidget {
  const DetailAppBarWidget(
      {super.key, required this.pokemon, required this.onBack});

  final Pokemon pokemon;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: AppBar(
        elevation: 0,
        backgroundColor: pokemon.baseColor!,
        leading: IconButton(
            onPressed: onBack,
            icon: const Icon(Icons.chevron_left, size: 30.0)),
      ),
    );
  }
}
