import 'package:flutter/material.dart';
import './questions.dart';
import './answer.dart';
import './exit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Simple Quiz App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _questionIndex = 0;
  var questions = [
      {
        'questionText': 'Please click your favourite colour.',
        'answers': ['Black', 'Red', 'Green', 'White'],
      },
      {
        'questionText': 'Please choose the pet you like.',
        'answers': ['Rabbit', 'Dog', 'Cat', 'Fish'],
      },
      {
        'questionText': 'Do you like this app?',
        'answers': ['No','No opinion','Yes'],
      },
      ];

  void _questionChange() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  void _score() {
    setState(() {
      _counter++;
    });
  }

  void _replay() {
    setState(() {
      _counter = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Question(
              questions[_questionIndex]['questionText'] as String,
            ),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_questionChange,answer);
            }).toList(),
            Text(
              'Current Score: $_counter',
               style: Theme.of(context).textTheme.headline6
            ),
          ],
        ),
      ),
      floatingActionButton:Exit(_replay),
      ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
