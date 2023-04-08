import 'dart:convert';

import 'package:get/get.dart';
import 'package:valorantapi/models/data_model.dart';
import 'package:http/http.dart' as http;
class HomeScreenController extends GetxController{
  var characters = <Character>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
   fetchUsers();
    super.onInit();
   

  }
 void fetchUsers() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse("https://valorant-api.com/v1/agents"));
      if (response.statusCode == 200) {
        final jsonList = json.decode(response.body)['data'] as List<dynamic>;
        List<Character> users = jsonList.map((json) => Character.fromJson(json)).toList();
        characters.assignAll(users);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

}