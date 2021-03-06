import 'package:first_app/ListViewApp.dart';
import 'package:flutter/material.dart';

import 'Global.dart';
import 'route.dart';

const globalWidth = 100.0;
const globalHeight = 100.0;
const globalBorder = 10.0;

void main() {
  runApp(new InfoApp());
}

class InfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Welcome to home page',
        //这里设置路由规则
        routes: routes,
        home: Builder(
          builder: (context) {
            Global.context = context;
            return Scaffold(
              appBar: AppBar(
                title: Text('Welcome to home page'),
                centerTitle: false,
              ),
              body: ListView(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 12, right: 12),
                    child: MaterialButton(
                      child: Text("基本组件的使用"),
                      onPressed: () {
                        Navigator.pushNamed(context, ROUTE_BASIC_WIDGET);
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                child: Text("list"),
                onPressed: () => {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return ListViewApp();
                      }))
                    },
              ),
            );
          },
        ));
  }
}

//------------------ TapBoxA -----------------------------
//widget管理自己的state
class TabBoxA extends StatefulWidget {
  TabBoxA({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _TapboxAState();
  }
}

class _TapboxAState extends State<TabBoxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _handleTap,
        child: Container(
          child: Center(
            child: Text(
              _active ? 'TapBoxA Active' : 'TapBoxA Inactive',
              style: TextStyle(fontSize: 32.0, color: Colors.white),
            ),
          ),
          width: globalWidth,
          height: globalHeight,
          decoration: BoxDecoration(
              color: _active ? Colors.lightGreen[700] : Colors.grey[600]),
        ));
  }
}

//------------------ TapBoxB -----------------------------
//Parentwidget管理state
class ParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ParentWidgetState();
  }
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // child: TapBoxB(
      child: TapBoxC(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

class TapBoxB extends StatelessWidget {
  TapBoxB({Key key, this.active = false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: _handleTap,
        child: Container(
          child: Center(
            child: Text(
              active ? 'TapBoxB Active' : 'TapBoxB Inactive',
              style: TextStyle(fontSize: 32.0, color: Colors.white),
            ),
          ),
          width: globalWidth,
          height: globalHeight,
          decoration: BoxDecoration(
              color: active ? Colors.lightGreen[700] : Colors.grey[600]),
        ));
  }
}

//------------------ TapBoxC -----------------------------
//混合方式管理state
class TapBoxC extends StatefulWidget {
  TapBoxC({Key key, this.active = false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  _TapBoxCState createState() {
    return new _TapBoxCState();
  }
}

class _TapBoxCState extends State<TapBoxC> {
  bool _highLight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highLight = true;
    });
  }

  void _handleTapUp(TapUpDetails datails) {
    setState(() {
      _highLight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highLight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: Container(
        child: Center(
          child: Text(
            widget.active ? "TapBoxC Active" : 'TapBoxC Inactive',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: globalWidth,
        height: globalHeight,
        decoration: BoxDecoration(
            color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
            border: _highLight
                ? Border.all(color: Colors.teal[700], width: globalBorder)
                : null),
      ),
    );
  }
}
