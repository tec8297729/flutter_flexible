import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:flexible/utils/dio/safeRequest.dart'; // 请求底层
import 'package:flexible/stores/counterStore/counterStore.dart'; // 状态管理

class Home extends StatefulWidget {
  Home({Key key, this.params}) : super(key: key);
  final params;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with WidgetsBindingObserver {
  CounterStore _counter; // mobx中的counter实例化

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies(); // 生命周期组件变化的时候触发
  }

  void _incrementCounter() {
    _counter.increment(); // mobx中的值 加加value
    // _counter.fetchData();
    // 请求组件使用，同dio组件request方法
    safeRequest('http://yapi.demo.qunar.com/mock/1311/data').then((res) {
      print(res['num']);
    });
  }

  @override
  Widget build(BuildContext context) {
    _counter = Provider.of<CounterStore>(context); // 实例化类，可多页共享数据

    return Scaffold(
      appBar: AppBar(
        title: Text('home页面'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: List.generate(1, (index) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  child: Text(
                    '点我去testMobx页',
                    style: TextStyle(fontSize: 32),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/testMobx',
                        arguments: {'data': '路由传参'});
                  },
                ),
                Observer(
                  builder: (_) => Text(
                    '${_counter.value}',
                    style: Theme.of(context).textTheme.display1,
                  ),
                ),
                ColorFiltered(
                  // 颜色过滤参数（颜色，混合模式）
                  colorFilter:
                      ColorFilter.mode(Colors.pink, BlendMode.softLight),
                  // 显示的组件
                  child: Image.network(
                      'https://ss3.baidu.com/-rVXeDTa2gU2pMbgoY3K/it/u=1387154205,2414066132&fm=202&mola=new&crop=v1'),
                ),
              ],
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  // 显示的每个组件的显示的内容，这里面只是简单演示渲染
  List<String> toggleItem = ['1', '2', '3'];
  // 记录每个按钮选中状态
  List<bool> isSelected = [false, false, false];
}
