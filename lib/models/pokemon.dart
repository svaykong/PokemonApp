import 'package:equatable/equatable.dart';

class PokemonData extends Equatable {
  final int count;
  final String? next;
  final String? previous;
  final List<Pokemon> pokemons;
  final bool canLoadNextRequest;

  const PokemonData({
    required this.count,
    this.next,
    this.previous,
    required this.pokemons,
    this.canLoadNextRequest = false,
  });

  @override
  List<Object?> get props => [count, next, previous, pokemons];

  factory PokemonData.fromJson(Map<String, dynamic> json) {
    final list = (json["results"]) as List;

    return PokemonData(
      count: json["count"],
      next: json["next"],
      previous: json["previous"],
      pokemons: list.map((result) => Pokemon.fromJson(result)).toList(),
      canLoadNextRequest: json["next"] == null ? false : true,
    );
  }
}

class Pokemon extends Equatable {
  final int id;
  final String name;
  final String url;
  final String? error;
  // String get imageURL2 => "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png";
  // String get imageURL => "https://www.serebii.net/pokemongo/pokemon/$id.png";
  List<String>? types;

  Pokemon({
    required this.id,
    required this.name,
    required this.url,
    this.error,
    this.types,
  });

  String get imageURL {
    String imgID =
        "https://www.serebii.net/pokemongo/pokemon/"; // end at 905.png
    if (id < 10) {
      imgID += "00$id.png";
    } else if (id < 100) {
      imgID += "0$id.png";
    } else {
      imgID += "$id.png";
    }

    return imgID;
  }

  @override
  List<Object?> get props => [name, url];

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json["url"] != null
          ? int.parse(json["url"].toString().split("/")[6])
          : 0,
      name: json["name"] ?? "",
      url: json["url"] ?? "",
      error: json["error"],
    );
  }
}
