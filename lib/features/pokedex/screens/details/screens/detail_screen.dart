import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/pokedex/screens/details/screens/widgets/detail_appbar.dart';
import 'package:pokedex/features/pokedex/screens/details/screens/widgets/detail_list.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    required this.pokemon,
    required this.list,
    required this.onBack,
    required this.controller,
  });
  final Pokemon pokemon;

  final List<Pokemon> list;
  final VoidCallback onBack;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        DetailAppBarWidget(
          pokemon: pokemon,
          onBack: onBack,
        ),
        DetailListWidget(
          pokemon: pokemon,
          list: list,
          controller: controller,
        )
      ],
    ));
  }
}
