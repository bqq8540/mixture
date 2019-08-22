import 'dart:ui' as prefix0;

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'tool.dart';
import 'dart:ui';

class ReportPageWidget extends StatefulWidget {
  ReportPageWidget({Key key, this.title = ""}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _ReportPageState();
  }
}

class _ReportPageState extends State<ReportPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () {
              NativeEachOtherTool.postMessage("naviToBack", {"animate": "1"});
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
          color: Colors.red[200],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('这是一个flutter首页${widget.title}'),
              ],
            ),
          ),
        ));
  }
}
