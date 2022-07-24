import 'package:flutter/material.dart';

Color getPokemonTypeColor(String type) {
  Color color;

  switch (type) {
    case 'normal':
      color = const Color(0xFFbdbeb0);
      break;
    case 'poison':
      color = const Color(0xFF995E98);
      break;
    case 'psychic':
      color = const Color(0xFFE96EB0);
      break;
    case 'grass':
      color = const Color(0xFF9CD363);
      break;
    case 'ground':
      color = const Color(0xFFE3C969);
      break;
    case 'ice':
      color = const Color(0xFFAFF4FD);
      break;
    case 'fire':
      color = const Color(0xFFE7614D);
      break;
    case 'rock':
      color = const Color(0xFFCBBD7C);
      break;
    case 'dragon':
      color = const Color(0xFF8475F7);
      break;
    case 'water':
      color = const Color(0xFF6DACF8);
      break;
    case 'bug':
      color = const Color(0xFFC5D24A);
      break;
    case 'dark':
      color = const Color(0xFF886958);
      break;
    case 'fighting':
      color = const Color(0xFF9E5A4A);
      break;
    case 'ghost':
      color = const Color(0xFF7774CF);
      break;
    case 'steel':
      color = const Color(0xFFC3C3D9);
      break;
    case 'flying':
      color = const Color(0xFF81A2F8);
      break;
    // case 'normal':
    //   color = const Color(0xFFF9E65E);
    //   break;
    case 'fairy':
      color = const Color(0xFFEEB0FA);
      break;
    default:
      color = Colors.black;
      break;
  }

  return color;
}

Widget pokemonTypeView(String type) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4),
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: getPokemonTypeColor(type),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Text(
        type.toUpperCase(),
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
