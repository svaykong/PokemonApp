part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonEvent {}

class FetchListPokemonEvent extends PokemonEvent {
  final int page;

  FetchListPokemonEvent({required this.page});
}

// class FetchPokemonInfoEvent extends PokemonEvent {}

// class FetchPokemonSpeciesEvent extends PokemonEvent {}
