import 'package:flutter/material.dart';

class bottomNavigationBarItem extends StatefulWidget{
//  bottomNavigationBarItem({Key key}) : super(key:key);
  @override
  barItem createState() => barItem();
}

class barItem extends State<bottomNavigationBarItem>{
  int _selectedIndex = 1;
  final _widgetOptions = [
    Text('Index 0'),
    Text('Index 1'),
    Text('Index 2'),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items:<BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('Business')),
            BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('School')),
          ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: _onTtemTapped,
      ),
    );
  }
  void _onTtemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
}