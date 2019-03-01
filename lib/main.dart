import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/tarBar/tarBar.dart';
import 'package:flutter_app/view/nestedScrollView.dart';

void main() {
  runApp(new FriendlychatApp());
}

const String _name = "Tongle";

class FriendlychatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
        title: "Friendlychat",
        theme: defaultTargetPlatform == TargetPlatform.iOS
            ? kIOSTheme
            : kDefaultTheme,
        home: new ChatScreen(),
        routes: <String, WidgetBuilder>{
          // 这里可以定义静态路由，不能传递参数
          '/router/Second': (_) => new MyApp(),
        });
  }
}

class ChatScreen extends StatefulWidget {
  @override //@override 是一个Dart注释，表示标记方法会覆盖超类的方法
  State createState() => new ChatScreenState(
        todos: new List.generate(
          1,
          (i) => new Todo('tongle', 'A description of what to be done fo todo'),
        ),
      );
}

final ThemeData kIOSTheme = new ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light,
);

final ThemeData kDefaultTheme = new ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.orangeAccent[400],
);

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final List<ChatMessage> _message = <ChatMessage>[]; //此列表可滚动，以便用户可以查看聊天记
  final TextEditingController _textController = new TextEditingController();
  bool _isComposing = false;
  final List<Todo> todos;

  ChatScreenState({this.todos});

  @override
  void dispose() {
    for (ChatMessage message in _message) message.animationController.dispose();
    super.dispose();
  }

  Widget _buildTextComposer() {
    return new IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller:
                    _textController, //为了控制文本字段的内容，我们将为TextField构造函数提供一个TextEditingController。该控制器还可用于清除字段或读取其值
                onChanged: (String text) {
                  setState(() {
                    _isComposing = text.length > 0;
                  });
                },
                onSubmitted: _handleSubmitted,
                decoration:
                    new InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: Theme.of(context).platform == TargetPlatform.iOS
                  ? new CupertinoButton(
                      child: new Text("send"),
                      onPressed: _isComposing
                          ? () => _handleSubmitted(_textController.text)
                          : null,
                    )
                  : new IconButton(
                      icon: new Icon(Icons.send),
                      onPressed: _isComposing
                          ? () => _handleSubmitted(_textController.text)
                          : null,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear(); //清除该字段
    setState(() {
      _isComposing = false;
    });
    ChatMessage message = new ChatMessage(
      text: text,
      animationController: new AnimationController(
        duration: new Duration(milliseconds: 700),
        vsync: this,
      ),
    );
    setState(() {
      _message.insert(0, message);
    });
    message.animationController.forward();
  }

// 跳转简单传参
  void _pressIconButton() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new MyApp(
        todo: todos[0],
      );
    }));
  }

  void _airDress() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new nestScrollView();
    }));
  }

  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      // 该小部件具有一个简单AppBar的子小部件。
      appBar: new AppBar(
        title: new Text("Friendlychat"),
        actions: <Widget>[
          new IconButton(
              icon: const Icon(Icons.list), onPressed: _pressIconButton),
          new IconButton(
            icon: Icon(Icons.playlist_play),
            tooltip: 'Air it',
            onPressed: _airDress,
          ),
        ],
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),
      body: Container(
          child: new Column(
            //可以使用多个子窗口小部件，它们将是滚动列表和输入字段的行
            children: <Widget>[
              new Flexible(
                child: new ListView.builder(
                  padding: new EdgeInsets.all(8.0),
                  reverse: true, //使ListView开始从屏幕底
                  itemBuilder: (_, int index) =>
                      _message[index], //用于构建每个小部件的函数[index]
                  itemCount: _message.length, //指定列表中的消息数
                ),
              ),
              new Divider(height: 1.0),
              new Container(
                // 作为文本编辑器的父级，可用于定义背景图像，填充，边距和其他常见布局细节                                          //new
                decoration: new BoxDecoration(
                    //创建一个新的BoxDecoration对象，它定义背景色
                    color:
                        Theme.of(context).cardColor), //用于撰写消息的UI提供了与消息列表不同的背景。
                child: _buildTextComposer(),
              ),
            ],
          ),
          decoration: Theme.of(context).platform == TargetPlatform.iOS
              ? new BoxDecoration(
                  border: new Border(
                  top: new BorderSide(color: Colors.grey[200]),
                ))
              : null),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.animationController});
  final String text;
  final AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new SizeTransition(
        sizeFactor: new CurvedAnimation(
            parent: animationController, curve: Curves.easeOut),
        axisAlignment: 0.0,
        child: new Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.only(right: 16.0),
                child: new CircleAvatar(child: new Text(_name[0])),
              ),
              new Expanded(
                // 字换行功能
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(_name, style: Theme.of(context).textTheme.subhead),
                    new Container(
                      margin: const EdgeInsets.only(top: 5.0),
                      child: new Text(text),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
