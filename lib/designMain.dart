import 'package:flutter/material.dart';

void main() {
  // Add a Drawer to a screen
  // runApp(MyApp());

  // Display a snackbar
  runApp(SnackBarDemo());
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

// Display a snackbar
class SnackBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SnackBar Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('SnackBar Demo'),
        ),
        body: SnackBarPage(),
      ),
    );
  }
}

class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: Text('Yay! A SnackBar!'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Undo 버튼을 눌렀을 때 동작하는 내용
              },
            ),
          );

          // 위젯 트리에서 Scaffold를 찾아 SnackBar를 표시한다.
          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: Text('Show SnackBar'),
      ),
    );
  }
}
