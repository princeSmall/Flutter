import 'package:flutter/material.dart';
import 'package:flutter_app/tarBar/newChapterTwo.dart';
import 'package:flutter_app/tarBar/newChapterOne.dart';
import 'package:flutter_app/tarBar/newChapterThree.dart';

class MyApp extends StatefulWidget {
  String title;
  final Todo todo;
  MyApp({this.todo, this.title});
  @override
  State createState() => new tabBarApp();
}

class tabBarApp extends State<MyApp> with TickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new TabBarView(controller: controller, children: [
          new newChapterOne(),
          new newChapterTwo(),
          new newChapterThree()
        ]),
        appBar: new AppBar(
          title: new Text(widget.todo.title),
        ),
        bottomNavigationBar: new Material(
          color: Colors.blue,
          child: new TabBar(
            controller: controller,
            tabs: [
              new Tab(
                text: 'one',
                icon: new Icon(Icons.message),
              ),
              new Tab(
                text: 'two',
                icon: new Icon(Icons.movie),
              ),
              new Tab(
                text: 'three',
                icon: new Icon(Icons.menu),
              )
            ],
          ),
        )
        // ignore: expected_token
        );
  }
}

class Todo {
  final String title;
  final String description;
  Todo(this.title, this.description);
}
