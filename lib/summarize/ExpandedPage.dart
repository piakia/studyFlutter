import 'package:flutter/material.dart';

/// Expanded继承Flexible 默认的flex为1
/// Flexible的flex属性就是权重
///
class ExpandedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expanded实现权重"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.lightGreenAccent,
                    child: Text("Spring"),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.yellowAccent,
                    child: Text("Summer"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.deepOrangeAccent,
                    child: Text("Autom"),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.lightBlue,
                    child: Text("Winter"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
