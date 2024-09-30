import 'package:flutter/material.dart';
import 'package:dp_stopwatch/dp_stopwatch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StopWatch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'StopWatch'),
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
  final stopwatchViewModel = DPStopwatchViewModel(
    clockTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 32,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'The Clock',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            DPStopWatchWidget(
              stopwatchViewModel,
            ),
            const SizedBox(height: 16),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                stopwatchViewModel.start?.call();
              },
              child: const Text('start'),
            ),
            const SizedBox(height: 16),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                stopwatchViewModel.pause?.call();
              },
              child: const Text('pause'),
            ),
            const SizedBox(height: 16),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                stopwatchViewModel.resume?.call();
              },
              child: const Text('resume'),
            ),
            const SizedBox(height: 16),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                stopwatchViewModel.stop?.call();
              },
              child: const Text('stop'),
            ),
          ],
        ),
      ),
    );
  }
}