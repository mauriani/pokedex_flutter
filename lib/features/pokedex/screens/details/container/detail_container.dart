import 'package:flutter/material.dart';
import 'package:pokedex/common/error/failure.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/common/repositories/pokemon_repository.dart';
import 'package:pokedex/common/widgets/error/error.dart';
import 'package:pokedex/common/widgets/loading/loading.dart';
import 'package:pokedex/features/pokedex/screens/details/screens/detail_screen.dart';

class DetailArguments {
  final Pokemon pokemon;

  DetailArguments({required this.pokemon});
}

class DetailContainer extends StatelessWidget {
  const DetailContainer(
      {super.key, required this.repository, required this.arguments});
  final IPokemonRepository repository;
  final DetailArguments arguments;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemon(),
      builder: (context, snapshot) {
        // significa que esta cattegando
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loading();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return DetailScreen(
            pokemon: arguments.pokemon,
            list: snapshot.data!,
          );
        }

        if (snapshot.hasError) {
          return Error(error: (snapshot.error as Failure).message!);
        }

        return Container();
      },
    );
  }
}
