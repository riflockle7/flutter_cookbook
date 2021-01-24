import 'package:flutter/material.dart';

void main() {
  // Add a Drawer to a screen
  runApp(MyApp());
}

// Add a Drawer to a screen
class MyApp extends StatelessWidget {
  final appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('My Page!')),
      drawer: Drawer(
        // 리스트뷰를 통해 세로 스크롤이 가능하도록 함
        child: ListView(
          // 리스트뷰에서는 패딩이 없어야 한다.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // 드로우어를 닫는다.
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // 드로우어를 닫는다.
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
