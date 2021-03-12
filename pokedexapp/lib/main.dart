import 'package:pokedexapp/app_navigator.dart';
import 'package:pokedexapp/bloc/nav_cubit.dart';
import 'package:pokedexapp/bloc/pokemon_bloc.dart';
import 'package:pokedexapp/bloc/pokemon_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedexapp/bloc/pokemon_event.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pokemonDetailsCubit = PokemonDetailsCubit();
    return MaterialApp(
      theme: Theme.of(context).copyWith(
          primaryColor: Color(0xFFE96EB0), accentColor: Color(0xFFE96EB0)),
      home: MultiBlocProvider(providers: [
        BlocProvider(
            create: (context) =>
                PokemonBloc()..add(PokemonPageRequest(page: 0))),
        BlocProvider(
            create: (context) =>
                NavCubit(pokemonDetailsCubit: pokemonDetailsCubit)),
        BlocProvider(create: (context) => pokemonDetailsCubit)
      ], child: AppNavigator()),
    );
  }
}
