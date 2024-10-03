import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/models/PokemonModel.dart';
import 'package:pokedex_app/services/PokemonServices.dart';
import 'package:pokedex_app/views/detailPokemonPage.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final PokemonServices _pokemonServices = PokemonServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade700,
        title: Text('PokeDex'),
      ),
      body: FutureBuilder<List<PokemonModel>>(
        future: _pokemonServices.fetchPokemons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Erro: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            final pokemons = snapshot.data!;
            return ListView.separated(
              itemCount: pokemons.length,
              itemBuilder: (context, index) {
                final pokemon = pokemons[index];
                return ListTile(
                  contentPadding: EdgeInsets.all(10),
                  title: Text(pokemon.name),
                  subtitle: Text('Peso: ${pokemon.weight}KG'),
                  leading: Image.network(pokemon.imageUrl),
                  onTap: () {
                    Get.to(() => DetailPokemonPage(pokemon: pokemon));
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) => Divider(),
            );
          } else {
            return Center(child: Text('Nenhum dado disponível'));
          }
        },
      ),
    );
  }
}
