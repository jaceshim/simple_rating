# Simple Rating

This plugin is rating widget that is using Icons.

## Getting Started
Add the module to your project ``pubspec.yaml``:
```yaml
...
dependencies:
 ...
 simple_rating: ^0.0.1
...
```
And install it using ``flutter packages get`` on your project folder. After that, just import the module and use it:

## Usage example

```dart
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

```
Enjoy!

## Constructor parameters
``` 
useHalfRating                   -   Whether to use half rating
onChanged                       -   Rating changed callback
starCount                       -   The maximum amount of stars
rating                          -   The current value of rating
size                            -   The size of a single star
color                           -   The body color of star
borderColor                     -   The border color of star
spacing                         -   Spacing between stars(default is 0.0)
icons                           -   Icon set of Empty, Full, Half
```

### Screenshots

![alt text](https://raw.githubusercontent.com/jaceshim/simple_rating/master/simple_rating.gif)

## Author
Developed by [Jace Shim (심천보)](https://www.facebook.com/jaceshim.kr)

## Contributing
Feel free to help!
