import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '/utils/app_navigator.dart';
import 'blocs/bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokemonDetailsCubit = PokemonDetailsCubit();
    return MaterialApp(
      title: 'Pokemon App',
      theme: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.red, accentColor: Colors.redAccent),
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider(
            create: (context) =>
                PokemonBloc()..add(FetchListPokemonEvent(page: 0))),
        BlocProvider(
          create: (context) =>
              NavCubit(pokemonDetailsCubit: pokemonDetailsCubit),
        ),
        BlocProvider(
          create: (context) => pokemonDetailsCubit,
        ),
      ], child: const AppNavigator()),
      debugShowCheckedModeBanner: false,
    );
  }
}
