import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'widget test',
    theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.red,
        appBarTheme: const AppBarTheme(color: Colors.red)),
    home: const HomeScreen(),
  ));
}
