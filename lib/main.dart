import 'package:flutter/material.dart';
import 'package:frivia/providers/theme_provider.dart';
import 'package:frivia/screens/Home_Page.dart';
import 'package:frivia/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return MaterialApp(
        title: 'Frivia',
        theme: Provider.of<ThemeProvider>(context).themeData,
        home: Home(),
      );
    });
  }
}
