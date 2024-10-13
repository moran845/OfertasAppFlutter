import 'package:flutter/material.dart';

class Avanzada extends StatelessWidget {
  const Avanzada({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BasicUI(),
    );
  }
}

class BasicUI extends StatefulWidget {
  const BasicUI({super.key});

  @override
  _BasicUIState createState() => _BasicUIState();
}

class _BasicUIState extends State<BasicUI> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Basica'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Usted ha presionado el boton estas veces:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
