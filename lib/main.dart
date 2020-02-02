import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: MyHomePage(title: 'Flutter приложение'));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController controllerA = TextEditingController();
  TextEditingController controllerB = TextEditingController();

  void _changeCounter(int change) {
    setState(() {
      _counter += change;
      print(_counter);
    });
  }

  void _rollCounter(String textA, String textB) {
    int a = int.parse(textA);
    int b = int.parse(textB);
    setState(() {
      // 5 + [0..6]
      _counter = a + Random().nextInt(b - a);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: Icon(Icons.home),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Вы нажали на кнопку столько раз:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                controller: controllerA,
                decoration: InputDecoration(hintText: 'От A'),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                controller: controllerB,
                decoration: InputDecoration(hintText: 'До B'),
                keyboardType: TextInputType.number,
              ),
            ),
            RaisedButton(
              onPressed: () => _rollCounter(
                controllerA.text,
                controllerB.text,
              ),
              color: Colors.redAccent,
              child: Text('Roll'),
            ),
          ],
        ),
      ),
      persistentFooterButtons: <Widget>[
        FloatingActionButton(
          onPressed: () => _changeCounter(-1),
          tooltip: 'Decrement',
          child: Icon(Icons.exposure_neg_1),
        ),
        FloatingActionButton(
          onPressed: () => _changeCounter(1),
          tooltip: 'Increment',
          child: Icon(Icons.plus_one),
        ),
      ],
    );
  }
}
// Ctrl + space
// Ctrl
