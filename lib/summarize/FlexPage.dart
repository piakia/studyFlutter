import 'package:flutter/material.dart';

///展示Flex的使用
///Flex有两个子类 Column 和 Row
///顾名思义Row是横向排列子布局
///Column是竖向排列子布局
///Flex有轴的概念
///横向排列子布局时(Row)，横着看是主轴，竖着看是交叉轴
///竖向排列子布局时(Column）竖着是主轴，横着是交叉轴
class FlexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          leading: BackButton(color: Colors.white),
          backgroundColor: Colors.blue,
          title: Text(
            "展示Flex的能力",
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            BackButton(color: Colors.white),
          ],
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              MaterialButton(
                color: Colors.blue,
                child: Text(
                  "mainAxis&corssAxis(轴)",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return AxisPage();
                  }));
                },
              ),
              MaterialButton(
                color: Colors.blue,
                child: Text(
                  "Row",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return RowPage();
                  }));
                },
              ),
              MaterialButton(
                color: Colors.blue,
                child: Text(
                  "Column",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ColumnPage();
                  }));
                },
              ),
            ],
          ),
        ));
  }
}

///展示Row的基本属性
class RowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("正在观看Row"),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Text(
              "spaceAround",
              style: TextStyle(color: Colors.black),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: getChild(),
          ),
          Center(
            child: Text(
              "spaceBetween",
              style: TextStyle(color: Colors.black),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: getChild(),
          ),
          Center(
            child: Text(
              "spaceEvenly",
              style: TextStyle(color: Colors.black),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: getChild(),
          )
        ],
      ),
    );
  }
}

///展示Column的基本属性
class ColumnPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("这里是Column"),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              's\np\na\nc\ne\nA\nr\no\nu\nn\nd',
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
            Column(
              children: getChild(),
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
            Text(
              's\np\na\nc\ne\nB\ne\nt\nw\ne\ne\nn',
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: getChild(),
            ),
            Text(
              's\np\na\nc\ne\nE\nv\ne\nn\nl\ny',
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: getChild(),
            ),
          ],
        ));
  }
}

///展示Axis(轴)的概念
class AxisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("轴的概念"),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Text(
              '竖向排列\n主轴居中\n交叉轴结尾',
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            color: Colors.black,
            height: 200,
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: getChild(),
            ),
          ),
          Center(
            child: Text(
              '横向排列\n主轴居中\n交叉轴结尾',
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            color: Colors.blue,
            height: 200,
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: getChild(),
            ),
          ),
        ],
      ),
    );
  }
}

//生成一个示例的子Widget
List<Widget> getChild() {
  return <Widget>[
    Container(
      color: Colors.lightGreenAccent,
      width: 30,
      height: 30,
      child: Center(
        child: Text(
          "1",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
    Container(
      color: Colors.amber,
      width: 30,
      height: 30,
      child: Center(
        child: Text(
          "2",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
    Container(
      color: Colors.brown,
      width: 30,
      height: 30,
      child: Center(
        child: Text(
          "3",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
    Container(
      color: Colors.cyan,
      width: 30,
      height: 30,
      child: Center(
        child: Text(
          "4",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
    Container(
      color: Colors.deepOrangeAccent,
      width: 30,
      height: 30,
      child: Center(
        child: Text(
          "5",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  ];
}
