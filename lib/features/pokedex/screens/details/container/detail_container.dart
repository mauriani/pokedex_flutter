import 'package:flutter/material.dart';
import 'package:pokedex/common/error/failure.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/common/repositories/pokemon_repository.dart';
import 'package:pokedex/common/widgets/error/error.dart';
import 'package:pokedex/common/widgets/loading/loading.dart';
import 'package:pokedex/features/pokedex/screens/details/screens/detail_screen.dart';

class DetailArguments {
  DetailArguments({required this.pokemon, this.index = 0});

  final Pokemon pokemon;
  final int? index;
}

class DetailContainer extends StatefulWidget {
  const DetailContainer({
    super.key,
    required this.repository,
    required this.arguments,
    required this.onBack,
  });

  final IPokemonRepository repository;
  final DetailArguments arguments;
  final VoidCallback onBack;

  @override
  State<DetailContainer> createState() => _DetailContainerState();
}

class _DetailContainerState extends State<DetailContainer> {
  late PageController controller;

  @override
  void initState() {
    controller = PageController(
        viewportFraction: 2, initialPage: widget.arguments.index!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: widget.repository.getAllPokemon(),
      builder: (context, snapshot) {
        // significa que esta cattegando
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loading();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return DetailScreen(
            pokemon: widget.arguments.pokemon,
            list: snapshot.data!,
            onBack: widget.onBack,
            controller: controller,
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
