import 'package:flutter/material.dart';
import 'package:simple_rating/simple_rating.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _rating = 0.0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Simple Rating example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SimpleRating(
                useHalfRating: true,
                onChanged: (v) {
                  setState(() {
                    this._rating = v;
                  });
                },
                starCount: 5,
                rating: _rating,
                size: 48,
                color: Colors.deepPurple,
                borderColor: Colors.deepPurple,
                spacing: 0.0,
              ),
              Text(
                "${this._rating}",
                style: TextStyle(fontSize: 24, color: Colors.deepPurple),
              )
            ],
          ),
        ),
      ),
    );
  }
}
