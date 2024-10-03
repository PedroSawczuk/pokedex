class PokemonModel {
  final String name;
  final int id;
  final String imageUrl;
  final double weight;
  final int gameIndex;
  final String pokemonColor;

  PokemonModel({
    required this.name,
    required this.id,
    required this.imageUrl,
    required this.weight,
    required this.gameIndex,
    required this.pokemonColor,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['sprites']['front_default'],
      weight: json['weight'] / 10,
      gameIndex: json['game_indices'][0]['game_index'],
      pokemonColor: json['game_indices'][0]['version']['name'],
    );
  }
}

  // "game_indices": [
  //   {
  //     "game_index": 26,
  //     "version": {
  //       "name": "red",
  //       "url": "https://pokeapi.co/api/v2/version/1/"
  //     }
  //   },