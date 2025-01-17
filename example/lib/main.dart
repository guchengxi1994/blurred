import 'package:blurred/blurred.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blurred Image Loader',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final sliderMax = 20.0;
  late double sliderValue;

  @override
  void initState() {
    super.initState();
    sliderValue = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blurred Image Loader'),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            BlurredImage.asset(
              'assets/img-small.jpg',
              blurValue: sliderValue,
            ),
            BlurredImage.asset(
              'assets/img.jpg',
              blurValue: sliderValue,
            ),
            Slider(
              value: sliderValue,
              max: sliderMax,
              onChanged: (newValue) => setState(() => sliderValue = newValue),
            ),
          ],
        ),
      ),
    );
  }
}
