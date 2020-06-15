import 'package:flutter/material.dart';
import 'screens/registerscreen.dart';
import 'screens/homescreen.dart';
import 'screens/loginscreen.dart';

final routes = {
  '/': (BuildContext context) => LoginPage(),
  '/home': (BuildContext context) => HomeScreen(),
  '/login': (BuildContext context) => LoginPage(),
  '/register': (BuildContext context) => RegisterPage(),
};
