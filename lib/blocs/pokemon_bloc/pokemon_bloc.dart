import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/model.dart';
import '../../resources/resource.dart';
// import '../../extensions/extension.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonInitial()) {
    final ApiRepository apiRepo = ApiRepository();

    // Register event handler: FetchListPokemonEvent
    on<FetchListPokemonEvent>((event, emit) async {
      try {
        emit(PokemonLoading());

        final pokemons = await apiRepo.fetchListPokemon(event.page);

        if (pokemons.isEmpty) {
          emit(const PokemonLoadError("The pokemon is empty"));
        } else if (pokemons.isNotEmpty && pokemons[0].error != null) {
          // log(pokemons[0].error == "");
          final msgError = "The was an error::${pokemons[0].error}";
          emit(PokemonLoadError(
              // ignore: prefer_contains
              (msgError.indexOf("Failed host lookup") > -1
                  ? "Please check your internet connection!"
                  : msgError)));
        } else {
          PokemonInfo pokemonInfo;
          for (int i = 0; i < pokemons.length; i++) {
            pokemonInfo = await apiRepo.fetchPokemonInfo(pokemons[i].id);
            pokemons[i].types = pokemonInfo.types;
          }

          emit(PokemonLoadSuccess(pokemons: pokemons));
        }
      } on NetworkError {
        emit(const PokemonLoadError(
            "Failed to fetch data. is your device online?"));
      }
    });
  }
}
