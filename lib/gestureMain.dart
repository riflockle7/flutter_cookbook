import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// void main() {
  // Add Material touch ripples
  // runApp(MyApp());

  // Handle taps
  // runApp(GestureDetectorApp());

  // Implement swipe to dismiss
  // runApp(SwipeApp());
// }

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

// Handle taps
class GestureDetectorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Gesture Demo';

    return MaterialApp(
      title: title,
      home: GestureDetectorPage(title: title),
    );
  }
}

class GestureDetectorPage extends StatelessWidget {
  final String title;

  GestureDetectorPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(child: GestureDetectorButton()),
    );
  }
}

class GestureDetectorButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // GestureDetector 가 버튼을 감쌈 (child)
    return GestureDetector(
        // 탭 할 떄 스낵바 올라옴
        onTap: () {
          final snackBar = SnackBar(content: Text("Tap"));

          Scaffold.of(context).showSnackBar(snackBar);
        },
        // 커스텀 버튼
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) => generateRows(context, index)));
  }

  Widget generateRows(BuildContext context, int type) {
    switch (type) {
      case 0:
        return RaisedButton(
          onPressed: () {
            final snackBar = SnackBar(content: Text("RaisedButton Clicked"));

            Scaffold.of(context).showSnackBar(snackBar);
          },
          child: Text("Raised Button"),
        );
      case 1:
        return ElevatedButton(
          onPressed: () {
            final snackBar = SnackBar(content: Text("ElevatedButton Clicked"));

            Scaffold.of(context).showSnackBar(snackBar);
          },
          child: Text('Elevated Button'),
        );
      case 2:
        return CupertinoButton(
          onPressed: () {
            final snackBar = SnackBar(content: Text("CupertinoButton Clicked"));

            Scaffold.of(context).showSnackBar(snackBar);
          },
          child: Text("Cupertino Button"),
        );
      default:
        return Container(
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Theme.of(context).buttonColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text('My Button'),
        );
    }
  }
}

// Implement swipe to dismiss
// remove 할 시 위젯을 삭제해야 하므로 StatefulWidget 을 사용
class SwipeApp extends StatefulWidget {
  SwipeApp({Key key}) : super(key: key);

  @override
  SwipeAppState createState() {
    return SwipeAppState();
  }
}

class SwipeAppState extends State<SwipeApp> {
  final items = List<String>.generate(20, (i) => "Item ${i + 1}");

  @override
  Widget build(BuildContext context) {
    final title = 'Dismissing Items';

    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return Dismissible(
              // Dismissible 위젯은 반드시 Key 를 포함해야 한다.
              // 키를 통해 Flutter 에서 위젯을 식별이 가능하다.
              key: Key(item),
              // 항목을 swipe 한 후, 수행할 작업을 앱에 알려주는 기능을 제공
              onDismissed: (direction) {
                // 데이터 삭제한 후 해당 내용대로 위젯 새로 그림
                setState(() {
                  items.removeAt(index);
                });

                // 스낵바 보여주기
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text("$item dismissed")));
              },
              // child 뒤에 보여줄 배경 위젯
              background: Container(color: Colors.red),
              // 가장 맨 앞에 보여질 위젯
              child: ListTile(title: Text('$item')),
            );
          },
        ),
      ),
    );
  }
}
