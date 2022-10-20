import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/pokedex/screens/details/container/detail_container.dart';
import 'package:pokedex/features/pokedex/screens/home/screens/widgets/pokemon_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.list, required this.onItemTap});

  final List<Pokemon> list;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        children: list.map((e) => PokemonItemWidget(pokemon: e)).toList(),
      ),
    ));
  }
}
