import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { // L'application en elle-même est un widget, d'où l'extension StatelessWidget
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { // Le build décrit comment est construit le front avec ses niveaux
    final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Welcome to Flutter', 
      home: Scaffold( // Le widget Scaffold contient par défaut l'appBar et le body de l'application
        appBar: AppBar( //L'appBar contient un widget AppBar qui contient ...
          title: const Text('Welcome to Flutter'), // ... un widget texte
        ),
        body: Center(
          child: Text(wordPair.asPascalCase)
        ),
      ),
    );
  }
}
