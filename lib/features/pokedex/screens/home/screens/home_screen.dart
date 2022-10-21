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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: AppBar(
              elevation: 0,
              title: const Padding(
                padding: EdgeInsets.all(10),
                child: Text('Pokedex',
                    style: TextStyle(
                      color: Color(0xFF32345a),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(6),
              ))),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 12,
            children: list
                .map((e) => PokemonItemWidget(pokemon: e, onTap: onItemTap))
                .toList(),
          ),
        ));
  }
}
