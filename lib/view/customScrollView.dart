import 'package:flutter/material.dart';

class customScrollView extends StatefulWidget {
  @override
  customScroll createState() => customScroll();
}

class customScroll extends State<customScrollView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('ScrollView'),
            ),
          ),
          SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,  // 控制横向数目
                mainAxisSpacing: 20.0,  // 纵向间距
                crossAxisSpacing: 10.0, // 横向间距
                childAspectRatio: 4.0, // 控制纵向数目
              ),
              delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index ) {
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.teal[100 *(index %9)],
                      child: Text('grid item $index'),
                    );
                  }))
        ],
      ),
    );
  }
}
