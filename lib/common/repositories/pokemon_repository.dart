import 'dart:convert';

import 'package:pokedex/common/consts/api_consts.dart';
import 'package:pokedex/common/error/failure.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:dio/dio.dart';

abstract class IPokemonRepository {
  Future<List<Pokemon>> getAllPokemon();
}

class PokemonRepository implements IPokemonRepository {
  final Dio dio;

  PokemonRepository({required this.dio});

  @override
  Future<List<Pokemon>> getAllPokemon() async {
    try {
      final response = await dio.get(ApiConsts.allPokemonsUrl);

      // retorna um map e permite que faça a interação
      final json = jsonDecode(response.data) as Map<String, dynamic>;

      // aqui acesso o meu json e pego o acesso a chave
      final list = json['pokemon'] as List<dynamic>;
      return list.map((e) => Pokemon.fromMap(e)).toList();
    } catch (e) {
      throw Failure(message: 'Não foi possível carregar os dados');
    }
  }
}
