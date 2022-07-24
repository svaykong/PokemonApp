import 'resource.dart';
import '../models/model.dart';

class ApiRepository {
  final ApiProvider _api = ApiProvider();

  Future<List<Pokemon>> fetchListPokemon(int pageIndex) async {
    return await _api.fetchListPokemon(pageIndex);
  }

  Future<PokemonInfo> fetchPokemonInfo(int pokemonId) async {
    return await _api.fetchPokemonInfo(pokemonId);
  }

  Future<PokemonSpecies> fetchPokemonSpecies(int pokemonId) async {
    return await _api.fetchPokemonSpecies(pokemonId);
  }
}

class NetworkError extends Error {}
