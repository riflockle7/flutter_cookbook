import 'package:flutter/material.dart';

void main() {
  // Create a grid list
  runApp(GridListApp());
}

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
