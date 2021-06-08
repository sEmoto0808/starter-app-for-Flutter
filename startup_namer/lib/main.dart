import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

/// Use arrow notation for one-line functions or methods.
void main() => runApp(MyApp());

/// Stateless widgets are immutable, meaning that their properties can’t change—all values are final.
class MyApp extends StatelessWidget {

  /// A widget’s main job is to provide a build() method that describes how to display the widget in terms of other, lower level widgets.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Startup Name Generator",
      home: RandomWords()
    );
  }
}

/// Stateful widgets maintain state that might change during the lifetime of the widget.
/// Implementing a stateful widget requires at least two classes: 1) a StatefulWidget class that creates an instance of 2) a State class.
/// The StatefulWidget class is, itself, immutable and can be thrown away and regenerated, but the State class persists over the lifetime of the widget.
class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

/// Prefixing an identifier with an underscore enforces privacy in the Dart language and is a recommended best practice for State objects.
class _RandomWordsState extends State<RandomWords> {

  final _suggestions = <WordPair>[];
  final _biggerFont = TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  /// This method builds the ListView that displays the suggested word pairing.
  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
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
