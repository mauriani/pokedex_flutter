import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/features/pokedex/routes/route.dart';

import 'common/repositories/pokemon_repository.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
      ),
      home: PokedexRoute(
        repository: PokemonRepository(
          dio: Dio(),
        ),
      ),
    );
  }
}
