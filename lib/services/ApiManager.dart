import 'dart:convert';

import 'package:flutter_pruebavacant/constants/Strings.dart';
import 'package:flutter_pruebavacant/models/UserInfo.dart';
import 'package:http/http.dart' as http;

class APIManager{

  List <UserModel> _userModelList;

  List<UserModel> getuserModelList() => _userModelList;

  Future <UserModel> getUsers() async{
    var client = http.Client();
    var usermodel = null;

    try {

      var response = await client.get(Strings.user_url);

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        usermodel = jsonMap.map((model) => UserModel.fromJson(model)).toList();
        _userModelList = usermodel;
        return usermodel;
      }
    }catch(Exception){
      return usermodel;
    }
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