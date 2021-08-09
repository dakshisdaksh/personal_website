import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:personal_website/models/github_model.dart';

Future<All> fetchRepos() async{
  final response = await http.get(Uri.parse("https://api.github.com/users/shhdwi/repos"));
  if (response.statusCode == 200){
    return All.fromJson(json.decode(response.body));


  }else {
    throw Exception("Failed to fetch repos");
  }
}