// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { // L'application en elle-même est un widget, d'où l'extension StatelessWidget
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { // Le build décrit comment est construit le front avec ses niveaux
    return const MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}


class RandomWords extends StatefulWidget { 
  const RandomWords({ Key? key }) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: const Text('Startup Name Generator'),
    ),
    body: _buildSuggestions(),
  );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder:  (context, i) { // itemBuilder est appelé pour chaque paire de mots suggérée et les place dans une ListTile
        if(i.isOdd) return const Divider(); // Quand la ligne est impaire, un divider est ajouté

        final index = i~/2; // Renvoie l'entier de la division : ça retourne le nombre de paire de mots, moins le nombre e divider
        if(index>= _suggestions.length) { // Si on atteint le bas de la liste,...
          _suggestions.addAll(generateWordPairs().take(10)); //... on en génère 10 de plus et les ajoute à la liste
        }
        return _buildRow(_suggestions[index]); // La fonction buildRow afffiche chaque nouvelles paires dans une ListTile
      });
  }

  Widget _buildRow(WordPair pair) {
  return ListTile(
    title: Text(
      pair.asPascalCase,
      style: _biggerFont,
    ),
  );
}
}