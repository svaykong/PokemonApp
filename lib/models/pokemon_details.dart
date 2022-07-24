import 'package:equatable/equatable.dart';

class PokemonDetails extends Equatable {
  final int id;
  final String name;
  final String imageURL;
  final List<String> types;
  final int height;
  final int weight;
  final String description;

  const PokemonDetails({
    required this.id,
    required this.name,
    required this.imageURL,
    required this.types,
    required this.height,
    required this.weight,
    required this.description,
  });

  @override
  List<Object?> get props => [id, name, imageURL, types, height, weight, description];
}
