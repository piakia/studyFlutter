import 'package:flutter/material.dart';

import '../custom.dart';

class TextPage extends StatelessWidget {
  var paint = Paint();

  @override
  Widget build(BuildContext context) {
    ///paint也很大 这里不详细写了
    paint.color = Colors.blue;
    return Scaffold(
      appBar: AppBar(
        title: Text("战术文本"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.yellow,
            padding: EdgeInsets.all(15),
            child: Center(
              child: Text(
                "这感觉已经不对，我努力在挽回,一些些应该体贴的感觉我没给。你嘟嘴许的愿望很卑微在妥协",
                style: TextStyle(color: Colors.white, background: paint),
                softWrap: true,

                ///排列方式 左向右 或者 右向左
                textDirection: TextDirection.ltr,
                maxLines: 1,
                //文字的战术方式 下面是文字过多时显示省略号
                overflow: TextOverflow.ellipsis,
                //style的结构体 包括了Text的所有别的属性
//                strutStyle: StrutStyle(),
              ),
            ),
          ),
          Container(
            color: Colors.blue,
            padding: EdgeInsets.all(15),
            child: Center(
              child: RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(text: "我的", style: TextStyle(color: Colors.yellow)),
                  TextSpan(
                      text: "你的", style: TextStyle(color: Colors.deepPurple)),
                  TextSpan(text: "她的", style: TextStyle(color: Colors.red)),
                ]),

                ///排列方式 左向右 或者 右向左
                textDirection: TextDirection.ltr,
                //style的结构体 包括了Text的所有别的属性
//                strutStyle: StrutStyle(),
              ),
            ),
          ),
          Container(
            color: Colors.blue,
            padding: EdgeInsets.all(15),
            child: Center(
              child: TextField(
                autofocus: true,

                ///限制为只能输入数字？？？很疑惑 为啥只限制数字
//                keyboardType: TextInputType.numberWithOptions(signed: true,decimal: true),
                onTap: () {
                  ///点击事件
                  Toast.show("onTap");
                },
                onChanged: (str) {
                  ///文字变化监听

                  Toast.show("onChanged$str");
                },
                onSubmitted: (str) {
                  ///提交监听
                  Toast.show("onSubmitted$str");
                },
                onEditingComplete: () {
                  ///编辑完成
                  Toast.show("onEditingComplete");
                },

                ///排列方式 左向右 或者 右向左
                textDirection: TextDirection.ltr,
                //style的结构体 包括了Text的所有别的属性
//                strutStyle: StrutStyle(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
