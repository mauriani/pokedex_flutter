import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.pokemon, required this.list});
  final Pokemon pokemon;
  final List<Pokemon> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: AppBar(
            backgroundColor: const Color(0xFF32345a),
            elevation: 0,
            title: Text(pokemon.name,
                style: const TextStyle(color: Colors.white, fontSize: 20)),
            centerTitle: true,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              SizedBox(
                height: 400,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: list
                      .map((e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(e.name),
                          ))
                      .toList(),
                ),
              )
            ],
          ),
        ));
  }
}
