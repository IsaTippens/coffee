import 'package:flutter/material.dart';
import 'package:coffee/Themes/dark_theme.dart';
import 'package:coffee/Pages/home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkTheme,
      home: const HomePage(),
    );
  }
}
