import 'dart:convert';

import 'package:valorantapi/models/data_model.dart';
import 'package:http/http.dart' as http;

class CharacterService{
  static const _baseUrl ="https://valorant-api.com/v1/agents";
//  static Future<List<Character>> getCharacter() async {
//     try {
//       final data = await http.get(Uri.parse(_baseUrl));
//       if (data.statusCode == 200) {
//         List results = json.decode(data.body);
//         print(results);
//         return results.map((character) => Character.fromJson(character)).toList();
//       } else {
//         return [];
//       }
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
  
  // static Future<List<Character>> getCharacter()async{
  //   final data = await http.get(Uri.parse(_baseUrl));

  //   if (data.statusCode==200) {
  //     List results = json.decode(data.body);
  //     return results.map((character) => Character.fromJson(character)).toList();

  //    // final character = Character.fromJson(jsonMap);
      
  //   } else{
  //     throw Exception("Failed to load Character");
  //   }


  // }
  static Future<List<Character>> getCharacter() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final Map<String,dynamic> data = jsonDecode(response.body)["data"];
      final List<Character> characters =[];
      data.forEach((key, value) {
        final character = Character.fromJson(value);
        characters.add(character);
        
      });
      return characters;
    } else {
      throw Exception('Failed to load users');
    }
  }
    
}
