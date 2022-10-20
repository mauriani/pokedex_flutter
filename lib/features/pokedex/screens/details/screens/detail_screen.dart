import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.name, required this.list});
  final String name;
  final List<Pokemon> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(name)),
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
