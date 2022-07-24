import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bloc.dart';
import '../widgets/widget.dart';
import '../models/model.dart';
import '../utils/util.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  double width = 0.0;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Pokemon App"),
      //   centerTitle: true,
      //   actions: [
      //     IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
      //   ],
      // ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PokemonLoadSuccess) {
            return _buildGridView(context, state.pokemons);
          } else if (state is PokemonLoadError) {
            return Center(
              child: Text(
                state.message.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _buildGridView(BuildContext context, List<Pokemon> pokemons) {
    return Stack(
      children: [
        Positioned(
            top: -50.0,
            right: -50.0,
            child: Image.asset(
              "assets/images/pokeball.png",
              width: 200.0,
              fit: BoxFit.fitWidth,
            )),
        const Positioned(
          top: 100.0,
          left: 20.0,
          child: Text(
            "Pokedex",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          top: 150.0,
          bottom: 0,
          width: width,
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.4,
              ),
              itemCount: pokemons.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    BlocProvider.of<NavCubit>(context).showPokemonDetails(
                      pokemons[index].id,
                    );
                  },
                  child: PokemonCard(
                    id: pokemons[index].id,
                    imageURL: pokemons[index].imageURL,
                    name: pokemons[index].name,
                    types: pokemons[index].types ?? [],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
