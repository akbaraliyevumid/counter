import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Counter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _reloadCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _vibration() {
    setState(() {
      switch (_counter) {
        case 32:
          HapticFeedback.vibrate();
          break;
        case 65:
          HapticFeedback.vibrate();
          break;
        case 98:
          HapticFeedback.vibrate();
          break;
        default:
      }
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
            /*const Text(
              'You have pushed the button this many times:',
            ),*/
            Text(
              '$_counter',
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 100),
              //style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                _vibration();

                _incrementCounter();
                //HapticFeedback.vibrate();
              },
              child: const Icon(Icons.add),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 100),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                _decrementCounter();
                HapticFeedback.vibrate();
              },
              child: const Icon(Icons.remove),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 75),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              _reloadCounter();
              HapticFeedback.vibrate();
            },
            tooltip: 'Clear',
            child: const Icon(Icons.replay_outlined),
          ),
        ],
      ),
    );
  }
}
