import 'package:flutter/material.dart';
import 'package:pokedex_app/models/PokemonModel.dart';

class DetailPokemonPage extends StatelessWidget {
  DetailPokemonPage({super.key, required this.pokemon});

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade700,
        title: Text(pokemon.name.toUpperCase()),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(
              pokemon.imageUrl,
            ),
            Text(
              pokemon.name.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Peso (Em KG): '),
                Text('${pokemon.weight} KG'),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Identificação: '),
                Text('${pokemon.gameIndex}'),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
