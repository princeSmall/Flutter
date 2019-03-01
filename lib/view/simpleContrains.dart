import 'package:flutter/material.dart';
import 'package:flutter_app/custom/container.dart';

class simpleContrainer extends StatefulWidget{
  @override
  createState() => containers();
}

class containers extends State<simpleContrainer>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple contrainer'),
      ),
      body: container
    );
  }
}




