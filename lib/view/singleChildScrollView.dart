import 'package:flutter/material.dart';

class singleChildScrollView extends StatefulWidget {
  @override
  singleContent createState() => singleContent();
}

class singleContent extends State<singleChildScrollView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstrints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstrints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Row(
                  children: <Widget>[
                    Container(
                      color: Colors.yellow,
                      width: 120.0,
                    ),
                    Container(
                      color: Colors.green,
                      width: 120,
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.blue,
                        width: 120.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      appBar: AppBar(
        title: Text('singChildScrollView'),
      ),
    );
  }
}
/****
child: Colomn(
children: <Widget>[
Container(
color: Colors.yellow,
height: 120.0,
),
Container(
color: Colors.green,
height: 120,
),
Expanded(
child:Container(
color: Colors.blue,
height: 120.0,
) ,
 **/
