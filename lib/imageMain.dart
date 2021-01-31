import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

void main() {
  // Display images from the internet
  // runApp(InternetImageApp());

  // Fade in images with a placeholder
  // runApp(PlaceHolderFadeApp());

  // Work with cached images
  runApp(CachedImageApp());
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

// Fade in images with a placeholder
class PlaceHolderFadeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Fade in images';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: 'https://picsum.photos/250?image=9',
          ),
          // child: FadeInImage.assetNetwork(
          //   placeholder: 'assets/loading.gif',
          //   image: 'https://picsum.photos/250?image=9',
          // ),
        ),
      ),
    );
  }
}

// Work with cached images
class CachedImageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Cached Images';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: CachedNetworkImage(
            placeholder: (context, url) => CircularProgressIndicator(),
            imageUrl:
            'https://picsum.photos/250?image=9',
          ),
        ),
      ),
    );
  }
}
