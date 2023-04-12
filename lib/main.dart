import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  var count = 1;

  void getNext() {
    // current = WordPair.random();
    count = count + 1;
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = {
      "current": appState.current, 
      "count": appState.count,
    };

    return Scaffold(
      body: Column(
        children: [
          Text('A random app'),
          // Text(appState.current.asUpperCase),
          // Text(pair["count"].toString()),
          BigCard(pair: pair["count"].toString()),
          ElevatedButton(
            onPressed: () {
              appState.getNext();
            }, 
            child: Text('Next')
          )
        ],
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    Key? key,
    required this.pair,
  }) : super(key: key);

  final String pair;

  @override
  Widget build(BuildContext context) {
    return Text(pair);
  }
}