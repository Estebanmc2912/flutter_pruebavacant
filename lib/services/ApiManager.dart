import 'dart:convert';

import 'package:flutter_pruebavacant/constants/Strings.dart';
import 'package:flutter_pruebavacant/models/UserInfo.dart';
import 'package:http/http.dart' as http;

class APIManager{
  Future <UserModel> getUsers() async{
    var client = http.Client();
    var usermodel;

    try {

      var response = await http.get(Strings.user_url);

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        usermodel = jsonMap.map((model) => UserModel.fromJson(model)).toList();
      }
    }catch(Exception){
      return usermodel;
    }
    return usermodel;
  }

 /* Future<List<UserModel>> _getUsers() async {

    var data = await http.get(Strings.user_url);
    var jsonData = json.decode(data.body);

    List<UserModel> users = [];
    for(var u in jsonData){
      UserModel user = UserModel(u["id"],u["name"],u["username"],u["email"],u["phone"],u["website"]);
      users.add(user);
    }

    print(users.length);
    return users;

  }*/

}