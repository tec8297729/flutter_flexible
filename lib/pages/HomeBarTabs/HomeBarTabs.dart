import 'package:flexible/pages/MyPersonal/MyPersonal.dart';
import 'package:flexible/pages/Search/Search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jh_debug/jh_debug.dart';
import 'package:provider/provider.dart';
import '../../components/TipsExitAnimated/TipsExitAnimated.dart';
import '../Hot/Hot.dart';
import '../Home/Home.dart';
import 'model/HomeBarTabsStore.dart';

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
/// Navigator.pushNamed(context, '/testDemo', arguments: {
///   'pageId': 2,
/// });
/// ```
class HomeBarTabs extends StatefulWidget {
  final params;

  HomeBarTabs({
    Key key,
    this.params,
  }) : super(key: key);

  @override
  _HomeBarTabsState createState() => _HomeBarTabsState();
}

class _HomeBarTabsState extends State<HomeBarTabs> {
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
    initTools();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  /// 处理tab默认显示索引
  handleCurrentIndex() {
    if (widget.params != null) {
      // 默认加载页面
      currentIndex = widget.params['pageId'] >= (barData.length)
          ? (barData.length - 1)
          : widget.params['pageId'];
    }

    // 初始化tab控制器
    pageController = PageController(
      initialPage: currentIndex, // 默认widget组件
      keepPage: true,
    );
  }

  /// 初始化第三方插件插件
  initTools() {
    // jhDebug全局调试插件初始化
    jhDebug.init(
      context: context,
      // 调试窗口按钮1事件
      btnTap1: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    // 初始化设计稿尺寸
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);
    Provider.of<HomeBarTabsStore>(context).saveController(pageController);
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: <Widget>[
          ...bodyWidget(),
        ],
        // 监听当前滑动到的页数
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),

      // 底部栏
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex, // 当前活动的bar索引
          onTap: (int idx) {
            setState(() {
              currentIndex = idx; // 存当前点击索引值
            });
            pageController.jumpToPage(idx); // 跳转到指定页
          },
          items: _generateBottomBars(), // 底部菜单导航
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

            // 连续二次回退键才可退出APP
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
  List<BottomNavigationBarItem> _generateBottomBars() {
    List<BottomNavigationBarItem> barList = [];
    for (var idx = 0; idx < barData.length; idx++) {
      barList.add(BottomNavigationBarItem(
        icon: Icon(
          barData[idx]['icon'], // 图标
          size: ScreenUtil().setSp(55),
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
    return barList;
  }
}
