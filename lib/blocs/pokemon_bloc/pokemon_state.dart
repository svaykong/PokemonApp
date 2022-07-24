part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonState extends Equatable {
  const PokemonState();

  @override 
  List<Object?> get props => [];
}

class PokemonInitial extends PokemonState {}

class PokemonLoading extends PokemonState {}

class PokemonLoadSuccess extends PokemonState {
  final List<Pokemon> pokemons;
  const PokemonLoadSuccess({required this.pokemons});
}

class PokemonLoadError extends PokemonState {
  final String? message;

  const PokemonLoadError(this.message);
}
