import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';

class DetailListWidget extends StatelessWidget {
  const DetailListWidget(
      {super.key, required this.pokemon, required this.list});

  final Pokemon pokemon;
  final List<Pokemon> list;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 87,
      left: 0,
      right: 0,
      height: 400,
      child: Container(
        color: pokemon.baseColor,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    pokemon.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                ),
                Text(
                  '#${pokemon.num}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: SizedBox(
                height: 250,
                width: double.infinity,
                child: PageView(
                  children: list
                      .map(
                        (e) => Image.network(
                          pokemon.image,
                          height: 40,
                          width: 40,
                          fit: BoxFit.contain,
                        ),
                      )
                      .toList(),
                )),
          )
        ]),
      ),
    );
  }
}
