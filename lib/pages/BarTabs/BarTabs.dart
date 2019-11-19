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
  PageController pageController;

  // 导航菜单渲染数据源
  List<Map<String, dynamic>> barData = [
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

  @override
  void initState() {
    super.initState();
    if (widget.params != null) {
      setState(() {
        // 默认加载页面
        currentIndex =
            widget.params['pageId'] > 3 ? 3 : widget.params['pageId'];
      });
    }

    // 初始化tab内容区域参数
    pageController = PageController(
      initialPage: currentIndex, // 默认显示哪个widget组件
      keepPage: true, // 是否开启缓存，即回退也会在当时的滚动位置
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: <Widget>[
          ...bodyWidget(),
        ],
        // 监听当前滑动到的页数
        onPageChanged: (index) => setState(() {
          currentIndex = index;
        }),
      ),

      // 底部栏
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // 只有设置fixed类型，底部bar才会显示所有的文字
          currentIndex: currentIndex, // 当前活动的bar索引
          // 点击事件
          onTap: (int idx) {
            setState(() {
              currentIndex = idx; // 存当前点击索引值
            });
            pageController.jumpToPage(idx); // 跳转到指定页
          },
          items: generateBottomBars(), // 底部菜单导航
        ),
      ),
    );
  }

  // 视图内容区域
  List<Widget> bodyWidget() {
    try {
      List<Widget> bodyList = barData.map((itemWidget) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            // 内容区域
            if (itemWidget['body'] != null)
              itemWidget['body'],

            // 自定义退出APP的动画组件
            Positioned(
              bottom: 30,
              child: TipsExitAnimated(),
            ),
          ],
        );
      }).toList();
      return bodyList;
    } catch (e) {
      throw Exception('barData导航菜单数据缺少body参数，或非IconData类型, errorMsg:$e');
    }
  }

  // 生成底部菜单导航
  List<BottomNavigationBarItem> generateBottomBars() {
    List<BottomNavigationBarItem> list = [];
    for (var idx = 0; idx < barData.length; idx++) {
      list.add(BottomNavigationBarItem(
        icon: Icon(
          barData[idx]['icon'], // 图标
          size: 32.0,
        ),
        title: Text(
          barData[idx]['title'],
          // 自定义样式
          // style: TextStyle(
          //   color: (currentIndex == idx ? Colors.blueGrey : Colors.black),
          // ),
        ),
      ));
    }
    return list;
  }
}
