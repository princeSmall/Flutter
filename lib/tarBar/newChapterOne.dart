import 'package:flutter/material.dart';

class newChapterOne extends StatefulWidget {
  @override
  ChapterOne createState() => new ChapterOne();
}

class ChapterOne extends State<newChapterOne> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Text('Deliver features faster', textAlign: TextAlign.center),
          ),
          Expanded(
            child: Text('Craft beautiful UIs', textAlign: TextAlign.center),
          ),
          Expanded(
            child: FittedBox(
              fit: BoxFit.contain, // otherwise the logo will be tiny
              child: const FlutterLogo(),
            ),
          ),
          Expanded(
              child: Container(
            constraints: BoxConstraints.expand(
              height:
                  Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
            ),
            padding: const EdgeInsets.all(8.0),
            color: Colors.teal.shade700,
            alignment: Alignment.center,
            foregroundDecoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'http://zslyzjj11.com/sy-wd1mf-pc/images/img/1.jpg'),
                centerSlice: Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
              ),
            ),
            transform: Matrix4.rotationZ(0.1),
          )),
        ],
      ),
    ));
  }
}
