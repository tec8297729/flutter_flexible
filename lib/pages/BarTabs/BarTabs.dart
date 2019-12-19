import 'package:flexible/pages/MyPersonal/MyPersonal.dart';
import 'package:flexible/pages/Search/Search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../components/TipsExitAnimated/TipsExitAnimated.dart';
import '../Hot/Hot.dart';
import '../Home/Home.dart';
import 'model/barTabsStore.dart';

/// [params] 别名路由传递的参数
/// [params.pageId] 跳转到指定tab页面（0第一页），如果不是别名路由跳转的话，又想实现跳转到指定tab页面，推荐别名路由跳转方式。
///```dart
/// // 手动传入参数跳转路由方式如下：
/// Navigator.of(context).push(
///   MaterialPageRoute(
///     builder: (context) => BarTabs(
///       params: {'pageId': 2}, // 跳转到tabs的第三个页面
///     ),pageId
///   )
/// );
///
/// // 别名路由跳转方式如下：
/// Navigator.pushNamed(context, '/', arguments: {
///   'pageId': 2,
/// });
/// ```
class BarTabs extends StatefulWidget {
  final params;

  BarTabs({
    Key key,
    this.params,
  }) : super(key: key);

  @override
  _BarTabsState createState() => _BarTabsState();
}

class _BarTabsState extends State<BarTabs> {
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
    handleCurrentIndex();

    // 初始化tab内容区域参数
    pageController = PageController(
      initialPage: currentIndex, // 默认widget组件索引
      keepPage: true, // 缓存
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  // 处理默认显示索引
  handleCurrentIndex() {
    if (widget.params != null) {
      setState(() {
        // 默认加载页面
        currentIndex = widget.params['pageId'] >= (barData.length)
            ? (barData.length - 1)
            : widget.params['pageId'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // 初始化设计稿尺寸
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);
    Provider.of<BarTabsStore>(context).saveController(pageController);
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
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex, // 当前活动的bar索引
          onTap: (int idx) {
            currentIndex = idx; // 存当前点击索引值
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
