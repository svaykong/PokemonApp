import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../blocs/bloc.dart';
import '../utils/util.dart';
import '../models/model.dart';

class PokemonDetailPage extends StatelessWidget {
  PokemonDetailPage({Key? key}) : super(key: key);

  double width = 0.0;
  double height = 0.0;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: Colors.redAccent,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: BlocBuilder<PokemonDetailsCubit, PokemonDetails?>(
          builder: (context, details) => AppBar(
            title: details?.name == null
                ? const SizedBox.shrink()
                : Text(details!.name),
            centerTitle: true,
          ),
        ),
      ),
      body: BlocBuilder<PokemonDetailsCubit, PokemonDetails?>(
          builder: (context, details) {
        return details != null
            ? _getColumn(context, details)
            : const Center(
                child: CircularProgressIndicator(),
              );
      }),
    );
  }

  Widget _getColumn(BuildContext context, PokemonDetails details) {
    return Center(
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Card(
                elevation: 5.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Hero(
                        tag: details.id,
                        child: CachedNetworkImage(
                          imageUrl: details.imageURL,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: details.types
                            .map((type) => pokemonTypeView(type))
                            .toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'ID: ${details.id}  -  Weight: ${details.weight}  -  Height: ${details.height}',
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(
            flex: 2,
            child: SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    details.description,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
