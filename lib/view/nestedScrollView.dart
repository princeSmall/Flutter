import 'package:flutter/material.dart';

class nestScrollView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final appTitle = 'ExpansionPanelListDemo';
    return new Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: new SingleChildScrollView(
        child: MyCustomExpandList(),
      ),
    );
  }
}

// Create a ExpandList Widget
class MyCustomExpandList extends StatefulWidget {
  @override
  MyCustomExpandListState createState() {
    return MyCustomExpandListState();
  }
}

class MyCustomExpandListState extends State<MyCustomExpandList> {
  var currentPanelIndex = -1;
  List<int> items;
  MyCustomExpandListState() {
    items = new List();
    for (int i = 0; i < 16; i++) {
      items.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new ExpansionPanelList(
      expansionCallback: (int panelIndex, bool isExpanded) {
        print('panelIndex:$panelIndex');
        setState(() {
          currentPanelIndex =
              (currentPanelIndex != panelIndex ? panelIndex : -1);
        });
      },
      children: items.map((i) {
        return new ExpansionPanel(
            headerBuilder: (context, isExpanded) {
              return new ListTile(
                title: new Text('“展开/折叠”:ExpansionTiles:$i'),
              );
            },
            body: new Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
              child: new ListBody(
                children: <Widget>[
                  new Text('第$i个标题下的内容:'),
                  new Text(
                      '同时ExpansionTile还可以套ExpansionTile，可以展开多级，想展开多少级就多少级。\n\nFlex小部件都可以包裹ExpansionPanelList，鉴于是可扩展的列表，我们需要用一个可滑动的小部件包裹他，便于滑动数据；ExpansionPanelList本身不支持滑动。。\n\n我们可以使用ListView包裹ExpansionPanelList也可以使用SingleChildScrollView来包裹ExpansionPanelList。'),
                ],
              ),
            ),
            isExpanded: currentPanelIndex == i);
      }).toList(),
    );
  }
}
