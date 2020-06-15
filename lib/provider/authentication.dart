import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app_updatetechltd/models/recipe.dart';

class Authentication with ChangeNotifier {
  String _token;
  bool _loggedIn = false;
  Recipe _recipesData;

  //getter
  String get token => _token;
  bool get loggedIn => _loggedIn;
  Recipe get recipeData => _recipesData;

  //API
  String _loginAPI = 'https://rcapp.utech.dev/api/auth/login';
  //String _userUrl = 'https://rcapp.utech.dev/api/user';
  String _recipeDataAPI = 'https://rcapp.utech.dev/api/recipes';

  //authenticate using email and password
  Future<void> authenticate(
      {String email, String password, BuildContext context}) async {
    try {
      //get the token first
      await http.post(_loginAPI, headers: {
        'Accept': 'application/json',
      }, body: {
        "email": email,
        "password": password
      }).then(
        (res) async {
          if (res.statusCode != 200 || res.statusCode > 400) {
            print(res.statusCode);
          } else {
            //Get Data using token
            _token = json.decode(res.body)['result']['token'];
            try {
              var value = await http.get(
                _recipeDataAPI,
                headers: {
                  'Accept': 'application/json',
                  'Authorization': 'Bearer $_token',
                },
              );
              if (value != null) {
                //get all data from json and put it to recipeData
                //since we are using provider, it can be accessed from anywhere
                _recipesData = Recipe.fromJson(json.decode(value.body));
                _loggedIn = true;
                notifyListeners();
              }
            } catch (e) {
              print(e);
            }
          }
        },
      );
    } catch (e) {
      print(e);
    }
    //notifyListeners();
  }
}
