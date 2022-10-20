import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/pokedex/screens/home/screens/widgets/type_widget.dart';

class PokemonItemWidget extends StatelessWidget {
  const PokemonItemWidget({super.key, required this.pokemon});
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
            color: pokemon.baseColor!.withOpacity(0.6),
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(pokemon.name),
                  Text(pokemon.num),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: pokemon.type
                          .map(
                            (e) => TypeyWidget(name: e),
                          )
                          .toList()),
                  Flexible(
                      child: Image.network(
                    pokemon.image,
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
