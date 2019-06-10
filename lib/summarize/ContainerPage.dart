import 'package:flutter/material.dart';

///探究Container的属性
///color属性和decoration不能同时设置
class ContainerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            //设置背景
            decoration: BoxDecoration(
              color: Colors.lightGreenAccent,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(width: 3, color: Color(0x90000000)),
            ),
            //设置前景
            foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              border: Border.all(width: 50, color: Color(0x30000000)),
            ),
            height: 250,
            width: 250,
            padding: EdgeInsets.all(25),
            margin: EdgeInsets.all(8),
            child: Text("我是一串长长的文本啊！！！！"),
          )
        ],
      ),
      appBar: AppBar(
        title: Text("Container的基本属性"),
      ),
    );
  }
}
