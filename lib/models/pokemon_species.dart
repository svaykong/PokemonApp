import 'package:equatable/equatable.dart';

// "flavor_text_entries": [
// {
//   "flavor_text": "A strange seed was\nplanted on its\nback at birth.\fThe plant sprouts\nand grows with\nthis POKéMON.",
// }
// ]
class PokemonSpecies extends Equatable {
  final String description;
  final String? error;

  const PokemonSpecies({required this.description, this.error});

  @override
  List<Object?> get props => [];

  factory PokemonSpecies.fromJson(Map<String, dynamic> json) {
    return PokemonSpecies(
      description: json["flavor_text_entries"] != null
          ? json["flavor_text_entries"][0]["flavor_text"]
          : "",
      error: json["error"],
    );
  }
}
