import 'package:flutter/material.dart';

import 'summarize/BasicPage.dart';
import 'summarize/ContainerPage.dart';
import 'summarize/ExpandedPage.dart';
import 'summarize/FlexPage.dart';
import 'summarize/TextPage.dart';

///这里创建路由的规则
///在MaterialApp的routes属性设置
///MaterialApp(routes: routes)
final Map<String, WidgetBuilder> routes = {
  ROUTE_BASIC_WIDGET: (context) => BasicWidgetPage(),
  ROUTE_FLEX_PAGE: (context) => FlexPage(),
  ROUTE_CONTAINER_PAGE: (context) => ContainerPage(),
  ROUTE_EXPANDED_PAGE: (context) => ExpandedPage(),
  ROUTE_TEXT_PAGE: (context) => TextPage(),
};

const ROUTE_MAIN = "/";
const ROUTE_BASIC_WIDGET = "/summarize/BasicWidget";
const ROUTE_FLEX_PAGE = "/summarize/FlexPage";
const ROUTE_CONTAINER_PAGE = "/summarize/ContainerPage";
const ROUTE_EXPANDED_PAGE = "/summarize/ExpandedPage";
const ROUTE_TEXT_PAGE = "/summarize/TextPage";
