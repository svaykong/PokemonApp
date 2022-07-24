import 'package:dio/dio.dart';

import '../models/model.dart';
import '../utils/util.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final _host = "https://pokeapi.co";
  var _url = "";
  var _params = "";

  Future<List<Pokemon>> fetchListPokemon(int pageIndex) async {
    try {
      _url = "/api/v2/pokemon";
      _params = "?limit=200";
      _params += "&offset=${(pageIndex * 200).toString()}";

      final Response response = await _dio.get(_host + _url + _params);
      final pokemonData = PokemonData.fromJson(response.data);
      if (pokemonData.count == 0 || pokemonData.pokemons.isEmpty) {
        return [];
      }

      return pokemonData.pokemons;
    } on DioError catch (error) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (error.response != null) {
        log('Dio error!');
        log('STATUS: ${error.response?.statusCode}');
        log('DATA: ${error.response?.data}');
        log('HEADERS: ${error.response?.headers}');

        return [
          Pokemon.fromJson({"error": error.response?.data})
        ];
      } else {
        // Error due to setting up or sending the request
        log('Error sending request!');
        log(error.message);

        return [
          Pokemon.fromJson({"error": error.message})
        ];
      }
    }
  }

  Future<PokemonInfo> fetchPokemonInfo(int pokemonId) async {
    try {
      _url = "/api/v2/pokemon/$pokemonId";
      final Response response = await _dio.get(_host + _url);
      final pokemonInfo = PokemonInfo.fromJson(response.data);
      return pokemonInfo;
    } on DioError catch (error) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (error.response != null) {
        log('Dio error!');
        log('STATUS: ${error.response?.statusCode}');
        log('DATA: ${error.response?.data}');
        log('HEADERS: ${error.response?.headers}');

        return PokemonInfo.fromJson({"error": error.response?.data});
      } else {
        // Error due to setting up or sending the request
        log('Error sending request!');
        log(error.message);

        return PokemonInfo.fromJson({"error": error.message});
      }
    }
  }

  Future<dynamic> fetchPokemonSpecies(int pokemonId) async {
    try {
      _url = "/api/v2/pokemon-species/$pokemonId";
      final Response response = await _dio.get(_host + _url);
      final pokemonSpecies = PokemonSpecies.fromJson(response.data);
      // log(pokemonSpecies);
      return pokemonSpecies;
    } on DioError catch (error) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (error.response != null) {
        log('Dio error!');
        log('STATUS: ${error.response?.statusCode}');
        log('DATA: ${error.response?.data}');
        log('HEADERS: ${error.response?.headers}');

        return PokemonSpecies.fromJson({"error": error.response?.data});
      } else {
        // Error due to setting up or sending the request
        log('Error sending request!');
        log(error.message);

        return PokemonSpecies.fromJson({"error": error.message});
      }
    }
  }
}
