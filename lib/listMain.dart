import 'package:flutter/material.dart';

void main() {
  // Create a grid list
  // runApp(GridListApp());

  // Create a horizontal list
  // runApp(HorizontalApp());

  // Create lists with different types of items
  // runApp(DynamicTypeApp(
  //   items: List<Object>.generate(1000, (i) {
  //     if (i % 10 == 0) {
  //       return HeadingItem("Heading $i");
  //     } else if (i % 7 == 0) {
  //       return Image.network('https://picsum.photos/250?image=9');
  //     } else {
  //       return MessageItem("Sender $i", "Message body$i");
  //     }
  //   }),
  // ));

  // Place a floating app bar above a list
  // runApp(HideAppBarApp());

  // Use List
  // runApp(UseListApp());

  // Work with long lists
  runApp(LongListApp(
    items: List<String>.generate(10000, (i) => "Item $i"),
  ));
}

// Create a grid list
class GridListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Grid List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: GridView.count(
          // 2개의 열
          crossAxisCount: 2,
          // 100개의 아이템을 generate 함
          children: List.generate(100, (index) {
            return Center(
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headline5,
              ),
            );
          }),
        ),
      ),
    );
  }
}

// Create a horizontal list
class HorizontalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Horizontal List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: 200.0,
          child: ListView(
            // 이걸로 인해 수평 정렬이 가능해짐
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 160.0,
                color: Colors.red,
              ),
              Container(
                width: 160.0,
                color: Colors.blue,
              ),
              Container(
                width: 160.0,
                color: Colors.green,
              ),
              Container(
                width: 160.0,
                color: Colors.yellow,
              ),
              Container(
                width: 160.0,
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Create lists with different types of items
class DynamicTypeApp extends StatelessWidget {
  final List<Object> items;

  DynamicTypeApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Mixed List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          // 아이템 개수
          itemCount: items.length,
          // 각 인덱스마다 만들어질 아이템 builder
          itemBuilder: (context, index) {
            final item = items[index];

            // ListTile 에 들어가는 게 title, subtitle 이어서
            // ListItem 을 이런식으로 만들었구나...
            if (item is ListItem)
              return ListTile(
                title: item.buildTitle(context),
                subtitle: item.buildSubtitle(context),
              );
            else
              return item;
          },
        ),
      ),
    );
  }
}

/// 다양한 유형의 ListItem 클래스
abstract class ListItem {
  /// 제목
  Widget buildTitle(BuildContext context);

  /// 부제목
  Widget buildSubtitle(BuildContext context);
}

/// 1-1. 헤드 아이템 (제목만 있음)
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headline5,
    );
  }

  Widget buildSubtitle(BuildContext context) => null;
}

/// 1-2. 메시지를 담고 있는 아이템 (제목, 부제목 있음)
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  Widget buildTitle(BuildContext context) => Text(sender);

  Widget buildSubtitle(BuildContext context) => Text(body);
}

// Place a floating app bar above a list
class HideAppBarApp extends StatelessWidget {
  HideAppBarApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Floating App Bar';

    return MaterialApp(
      title: title,
      home: Scaffold(
        // Scaffold 의 AppBar 를 적지 않는다.
        body: CustomScrollView(
          slivers: <Widget>[
            // 대신 CustomScrollView.slivers 에 AppBar 를 언급한다.
            SliverAppBar(
              title: Text(title),
              // 항목 목록을 위로 스크롤하기 시작하면 앱 바를 표시 할 수 있음(...?)
              floating: true,
              // 축소되는 크기를 시각화하는 자리 표시 위젯 표시
              flexibleSpace: Placeholder(),
              // 높이 좀 크게 만듬
              expandedHeight: 200,
            ),
            // SliverGrid 도 있음
            SliverList(
              // delegate 를 통해, 화면에서 스크롤되는 항목을 만듬
              delegate: SliverChildBuilderDelegate(
                // itemViewBuilder (인자 : context, 인덱스)
                (context, index) => ListTile(title: Text('Item #$index')),
                // 아이템 1000 개
                childCount: 1000,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Use lists
class UseListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Basic List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.map),
              title: Text('Map'),
            ),
            ListTile(
              leading: Icon(Icons.photo_album),
              title: Text('Album'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
            ),
          ],
        ),
      ),
    );
  }
}

// Work with long lists
class LongListApp extends StatelessWidget {
  final List<String> items;

  LongListApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Long List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${items[index]}'),
            );
          },
        ),
      ),
    );
  }
}
