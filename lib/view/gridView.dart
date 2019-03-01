import 'package:flutter/material.dart';

class grid extends State<gridView>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('gridView'),
        ),
        body: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(20.0),
              sliver: SliverGrid.count(
                crossAxisCount: 3,
                crossAxisSpacing: 10.0,
                children: <Widget>[
                  const Text('He\'d have you all unravel at the'),
                  const Text('Heed not the rabble'),
                  const Text('Sound of screams but the'),
                  const Text('Who scream'),
                  const Text('Revolution is coming...'),
                  const Text('Revolution, they...'),
                ],
              ),
            )
          ],
        ));
  }
}

class gridView extends StatefulWidget {
  @override
  grid createState() => grid();
}
