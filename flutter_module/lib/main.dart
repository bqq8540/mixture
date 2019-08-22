
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'tool.dart';

import 'home.dart'; //首页
import 'repot.dart'; //战报

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  static const methodChannel = const MethodChannel("com.pages.your/native_get");
  static const eventChannel = const EventChannel("com.pages.your/native_post");

  Widget widgetHome = ErrorPage();

  @override
  void initState() {
    super.initState();
    
    NativeEachOtherTool.receiveMessageFromNative('收到', _onEvent,onError: _onError);
  }

  _onEvent(Object event) {
    print("原生页面传过来了一些东西:${event.toString()}");
    Widget currentWidget ;
    switch (event.toString()) {
      case "home":
        currentWidget = FlutterHomePage(title: event.toString(),);
        break;
      case "report":
        currentWidget = ReportPageWidget(title: event.toString(),);
        break;
      default:
        currentWidget = ErrorPage();
    }

    setState(() {
      widgetHome = currentWidget;
    });

  }

  // 错误返回
  void _onError(Object error) {
    print('出错了$error');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: widgetHome,
    );
  }
}

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter'),
      ),
        body: Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              child: Text('点击返回'),
            )
          ],
        ),
      ),
    ));
  }
}
