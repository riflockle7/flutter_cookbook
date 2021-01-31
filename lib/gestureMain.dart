import 'package:flutter/material.dart';

void main() {
  // Add Material touch ripples
  runApp(MyApp());
}

// Add Material touch ripples
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'InkWell Demo';

    return MaterialApp(
      title: title,
      home: RippleButtonPage(title: title),
    );
  }
}

class RippleButtonPage extends StatelessWidget {
  final String title;

  RippleButtonPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(child: RippleButton()),
    );
  }
}

class RippleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // InkWell 위젯은 flat button widget 을 wrapping 한다.
    return InkWell(
      // 버튼 클릭 시 스낵바를 보여준다.
      onTap: () {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Tap'),
        ));
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        child: Text('Flat Button'),
      ),
    );
  }
}
