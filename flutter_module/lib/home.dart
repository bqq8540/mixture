
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'tool.dart';

class FlutterHomePage extends StatefulWidget{
  FlutterHomePage({Key key,this.title=""}):super(key:key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return FlutterHomeState();
  }
}

class FlutterHomeState extends State<FlutterHomePage>{
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.title,style: TextStyle(color: Colors.black),),
        leading: IconButton(
          onPressed: () {
            NativeEachOtherTool.postMessage("naviToBack",{"animate":"1"});
          },
          icon: Icon(Icons.arrow_back,color: Colors.red,),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('这是一个flutter首页${widget.title}'),
            MaterialButton(
              onPressed: (){
                Map<String, String> map = { "title": "这是一条来自flutter的参数" };
                NativeEachOtherTool.postMessage('toNativePush', map);
              },
              child: Text('向native传一条消息'),
            ),
            MaterialButton(
              onPressed: ()async{
                dynamic result;
                try{
                  Map<String, String> map = { "title": "互传参数" };
                  result = await NativeEachOtherTool.postMessage("toNativeSomething", map);
                  print('native传来的参数:$result');
                }on PlatformException{
                  result = 1000000;
                }
              },
              child: Text('向native发送一些东西并且拿回一些东西'),
            )
          ],
        ),
      ),
    );
  }
}
