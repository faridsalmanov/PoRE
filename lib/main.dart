import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WordCounter(),
    );
  }
}

class WordCounter extends StatefulWidget {
  @override
  _WordCounterState createState() => _WordCounterState();
}

class _WordCounterState extends State<WordCounter> {
  TextEditingController _textEditingController = TextEditingController();
  int wordCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Word Counter App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _textEditingController,
              onChanged: (text) {
                setState(() {
                  wordCount = countWordsWithoutPunctuation(text);
                });
              },
              decoration: InputDecoration(labelText: 'Enter your text'),
            ),
          ),
          Text('Word Count: $wordCount'),
        ],
      ),
    );
  }

  int countWordsWithoutPunctuation(String text) {
    final words = text.split(RegExp(r'\s+'));
    int count = 0;
    for (var word in words) {
      if (word.isNotEmpty && !RegExp(r'[.,;?!]').hasMatch(word)) {
        count++;
      }
    }
    return count;
  }
}
