import 'package:flexible/pages/MyPersonal/MyPersonal.dart';
import 'package:flexible/pages/Search/Search.dart';
import 'package:flutter/material.dart';
import '../../components/TipsExitAnimated/TipsExitAnimated.dart';
import '../Hot/Hot.dart';
import '../Home/Home.dart';

class Params {
  int pageId;
}

class BarTabs extends StatefulWidget {
  final params;

  BarTabs({
    Key key,
    this.params,
  }) : super(key: key);

  @override
  _BarTabsState createState() => _BarTabsState();
}

class _BarTabsState extends State<BarTabs> with SingleTickerProviderStateMixin {
  int currentIndex = 0; // 接收bar当前点击索引

  // 导航菜单渲染数据源
  List<Map> barData = [
    {
      'title': '首页',
      'icon': Icons.home,
    },
    {
      'title': '热门',
      'icon': Icons.whatshot,
    },
    {
      'title': '搜索',
      'icon': Icons.search,
    },
    {
      'title': '我的',
      'icon': Icons.person,
    },
  ];

  @override
  void initState() {
    super.initState();
    if (widget.params != null) {
      setState(() {
        // 默认加载页面
        currentIndex = widget.params['pageId'] > 3 ? 3 : widget.params['pageId'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          // 根据icon点击索引切换成指定页面组件
          [
            Home(),
            Hot(),
            Search(),
            MyPersonal(),
          ][currentIndex],
          // 自定义退出APP的动画组件
          Positioned(
            bottom: 60,
            child: TipsExitAnimated(),
          ),
        ],
      ),

      // 底部栏
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // 只有设置fixed类型，底部bar才会显示所有的文字
          currentIndex: currentIndex, // 当前活动的bar索引
          // 点击了的时候把当前索引存起来
          onTap: (int idx) {
            setState(() {
              currentIndex = idx; // 更新视图
            });
          },
          items: this.generateBottomBars(), // 底部菜单导航
        ),
      ),
    );
  }

  // 生成底部菜单导航
  List<BottomNavigationBarItem> generateBottomBars() {
    List<BottomNavigationBarItem> list = [];
    for (var idx = 0; idx < barData.length; idx++) {
      list.add(BottomNavigationBarItem(
        icon: Icon(
          barData[idx]['icon'], // 图标
          color: (currentIndex == idx ? Colors.blueGrey : Colors.black), // 颜色
          size: 32.0,
        ),
        title: Text(
          barData[idx]['title'],
          style: TextStyle(
            color: (currentIndex == idx ? Colors.blueGrey : Colors.black),
          ),
        ),
      ));
    }
    return list;
  }
}
