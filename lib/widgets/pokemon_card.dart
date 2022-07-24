import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import '../utils/util.dart';

class PokemonCard extends StatelessWidget {
  final int id;
  final String name;
  final String imageURL;
  final List<String> types;

  const PokemonCard({
    Key? key,
    required this.id,
    required this.name,
    required this.imageURL,
    required this.types,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Container(
        decoration: BoxDecoration(
          color: getPokemonTypeColor(types[0]),
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: -10.0,
              right: -10.0,
              child: Image.asset(
                "assets/images/pokeball.png",
                fit: BoxFit.fitHeight,
                height: 100.0,
              ),
            ),
            Positioned(
              bottom: 5.0,
              right: 5.0,
              child: Hero(
                tag: id,
                child: CachedNetworkImage(
                  imageUrl: imageURL,
                  height: 100,
                  fit: BoxFit.fitHeight,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 55,
              left: 15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: types
                    .map((type) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: pokemonTypeView(type),
                        ))
                    .toList(),
              ),
            ),
            Positioned(
              top: 30.0,
              left: 20.0,
              child: Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
