import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  // Display images from the internet
  runApp(InternetImageApp());
}

// Display images from the internet
class InternetImageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var title = 'Web Images';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Image.network('https://picsum.photos/250?image=9'),
      ),
    );
  }
}
