import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/page.dart';
import '../blocs/bloc.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, int?>(builder: (context, pokemonId) {
      return Navigator(
        pages: [
          MaterialPage(child: HomePage()),
          if (pokemonId != null) MaterialPage(child: PokemonDetailPage())
        ],
        onPopPage: (route, result) {
          BlocProvider.of<NavCubit>(context).popToPokedex();
          return route.didPop(result);
        },
      );
    });
  }
}
