import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/model.dart';
import '../../resources/resource.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetails?> {
  final _pokemonRepo = ApiRepository();

  PokemonDetailsCubit() : super(null);

  String getImgURL(int pokemonID) {
    String imgID =
        "https://www.serebii.net/pokemongo/pokemon/"; // end at 905.png
    if (pokemonID < 10) {
      imgID += "00$pokemonID.png";
    } else if (pokemonID < 100) {
      imgID += "0$pokemonID.png";
    } else {
      imgID += "$pokemonID.png";
    }

    return imgID;
  }

  void getPokemonDetails(int pokemonId) async {
    // Future.wait similiar to promise.all([]) in javascript
    final responses = await Future.wait([
      _pokemonRepo.fetchPokemonInfo(pokemonId),
      _pokemonRepo.fetchPokemonSpecies(pokemonId),
    ]);

    final pokemonInfo = responses[0] as PokemonInfo;
    final pokemonSpecies = responses[1] as PokemonSpecies;

    emit(PokemonDetails(
      id: pokemonInfo.id,
      name: pokemonInfo.name,
      imageURL: getImgURL(pokemonId), //pokemonInfo.imageURL,
      types: pokemonInfo.types,
      height: pokemonInfo.height,
      weight: pokemonInfo.weight,
      description: pokemonSpecies.description,
    ));
  }

  void clearPokemonDetails() => emit(null);
}
