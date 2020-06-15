import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/authentication.dart';
import 'routes.dart';

void main() => runApp(RecipeApp());

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Authentication()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Recipe App',
        routes: routes,
      ),
    );
  }
}
