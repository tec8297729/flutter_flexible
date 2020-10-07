import 'package:flutter/material.dart';

import 'MyPersonal/MyPersonal.dart';
import 'Search/Search.dart';
import 'Hot/Hot.dart';
import 'Home/Home.dart';

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
