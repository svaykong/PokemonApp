import 'package:equatable/equatable.dart';

class PokemonInfo extends Equatable {
  final int id;
  final String name;
  final String imageURL;
  final List<String> types;
  final int height;
  final int weight;
  final String? error;

  const PokemonInfo({
    required this.id,
    required this.name,
    required this.imageURL,
    required this.types,
    required this.height,
    required this.weight,
    this.error,
  });

  @override
  List<Object?> get props => [];

  factory PokemonInfo.fromJson(Map<String, dynamic> json) {
    final types = (json["types"] as List)
        .map((item) => item["type"]["name"].toString())
        .toList();

    return PokemonInfo(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      imageURL: json["sprites"] != null ? json["sprites"]["front_default"] : "",
      types: types,
      height: json["height"] ?? "",
      weight: json["weight"] ?? "",
      error: json["error"],
    );
  }
}
