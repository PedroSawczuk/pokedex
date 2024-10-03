import 'package:dio/dio.dart';
import 'package:pokedex_app/models/PokemonModel.dart';

class PokemonServices {
  final Dio _dio = Dio();

  Future<List<PokemonModel>> fetchPokemons() async {
    try {
      final response = await _dio.get('https://pokeapi.co/api/v2/pokemon?limit=100');
      if (response.statusCode == 200) {
        List<dynamic> results = response.data['results'];
        List<PokemonModel> pokemons = [];
        for (var result in results) {
          var detailResponse = await _dio.get(result['url']);
          pokemons.add(PokemonModel.fromJson(detailResponse.data));
        }
        return pokemons;
      } else {
        throw Exception('Erro ao buscar os Pokémons! Código: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro ao buscar os Pokémons: $e');
    }
  }
}
