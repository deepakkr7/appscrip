import 'dart:convert';

import 'package:appscrip/models/user.dart';
import 'package:http/http.dart'as http;

class ApiService{
  static const String Url='https://jsonplaceholder.typicode.com';
  Future<List<User>> getUsers()async{
    final response =await http.get(Uri.parse('$Url/users'));

    if(response.statusCode==200){
      final List<dynamic>jsonList=json.decode(response.body);
      return jsonList.map((json) => User.fromJson(json)).toList();
    }else{
      throw Exception('Failed to load users');
    }
  }
}