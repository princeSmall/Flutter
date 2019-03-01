import 'package:flutter/material.dart';
import 'package:flutter_app/view/singleChildScrollView.dart';
import 'package:flutter_app/view/customScrollView.dart';
import 'package:flutter_app/view/nestedScrollView.dart';
import 'package:flutter_app/view/gridView.dart';
import 'package:flutter_app/view/bottomNavigationBarItem.dart';
import 'package:flutter_app/view/simpleContrains.dart';

class newChapterThree extends StatefulWidget {
  @override
  ChapterThree createState() => new ChapterThree();
}

class ChapterThree extends State<newChapterThree> {
  final _Color = const TextStyle(color: Colors.orange, fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView.builder(
//边距
        padding: EdgeInsets.all(0.0),
//高度
//        itemExtent: 50.0,
//数目
        itemCount: 12,
//内容
        itemBuilder: (BuildContext context, int index) {
          if (index.isOdd)
            return new Divider(
              height: 0,
            );
          int s = index ~/ 2;
          String titles;
          if (s == 0) {
            titles = 'nestScrollView';
          } else if (s == 1) {
            titles = 'singleChildScrollView';
          } else if (s == 2) {
            titles = 'customScrollView';
          } else if (s == 3) {
            titles = 'gridView';
          } else if (s == 4) {
            titles = 'bottomNagationBarItem';
          }else if (s == 5){
            titles = 'simpleContrainer';
          }else {
            titles = '$s';
          }
          return new Container(
            height: 60.0,
            alignment: Alignment.center,
            key: new PageStorageKey<int>(index),
            child: new ListTile(
              title: new Text(titles, style: _Color),
              onTap: () => _pressSingleChildScrollView(s),
            ),
          );
        },
      ),
    );
  }

  void _pressSingleChildScrollView(int i) {
    print('$i');
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      if (i == 1) {
        return new singleChildScrollView();
      } else if (i == 2) {
        return new customScrollView();
      } else if ( i == 0){
        return new nestScrollView();
      } else if ( i == 3){
        return new gridView();
      }else if ( i == 4){
        return new bottomNavigationBarItem();
      }else if ( i == 5){
        return new simpleContrainer();
      }
    }));
  }
}
