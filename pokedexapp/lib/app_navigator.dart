import 'package:flutter/material.dart';
import 'package:pokedexapp/pokedex_view.dart';
import 'package:pokedexapp/pokemon_details_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/nav_cubit.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, int>(builder: (context, pokemonId) {
      return Navigator(
        pages: [
          MaterialPage(child: PokedexView()),
          if (pokemonId != null) MaterialPage(child: PokemonDetailsView())
        ],
        onPopPage: (route, result) {
          BlocProvider.of<NavCubit>(context).popToPokedex();
          return route.didPop(result);
        },
      );
    });
  }
}
