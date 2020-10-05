import 'package:flutter/material.dart';

import '../pages/AppHomePage/MyPersonal/MyPersonal.dart';
import '../pages/AppHomePage/Search/Search.dart';
import '../pages/AppHomePage/Hot/Hot.dart';
import '../pages/AppHomePage/Home/Home.dart';

// app主页底部bar
final List<Map<String, dynamic>> appBottomBar = [
  {
    'title': '首页',
    'icon': Icons.home,
    'body': Home(),
  },
  {
    'title': '热门',
    'icon': Icons.whatshot,
    'body': Hot(),
  },
  {
    'title': '搜索',
    'icon': Icons.search,
    'body': Search(),
  },
  {
    'title': '我的',
    'icon': Icons.person,
    'body': MyPersonal(),
  },
];
