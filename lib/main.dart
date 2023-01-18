import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:jogo_descobrir_palavra/screens/game_screen.dart';
import 'package:jogo_descobrir_palavra/screens/menu_screen.dart';

void main() {
  runApp(
    Phoenix(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Menu(),
        initialRoute: 'menu',
        routes: {
          'menu': (context) => const Menu(),
          'game': (context) => const GameScreen(level: 'easy'),
        });
  }
}
