import 'package:flutter/material.dart';

import '../route.dart';

class BasicWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("展示基本组件的使用"),
      ),
      body: ListView.builder(
        itemBuilder: builder,
        itemCount: pages.length,
      ),
    );
  }

  final pages = List.from(routes.keys);

  Widget builder(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.only(top: 12, left: 12, right: 12),
      child: MaterialButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(pages[index]),
        padding: EdgeInsets.only(top: 20, bottom: 20),
        onPressed: () {
          Navigator.pushNamed(context, pages[index]);
        },
      ),
    );
  }
}
