import 'package:flexible/service/service_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'model/counterStore/counterStore.dart'; // 状态管理

class Home extends StatefulWidget {
  Home({Key key, this.params}) : super(key: key);
  final params;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CounterStore _counter; // mobx中的counter实例化

  @override
  void initState() {
    super.initState();
    initFetch();
  }

  // 测试演示-初始化接口请求
  void initFetch() async {
    var res = await getHomeData();
    print('接口数据》》》${res}');
  }

  void _incrementCounter() {
    _counter.increment(); // 状态管理mobx中的值 加加value
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
                _button(
                  '点我去testMobx页',
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/testMobx',
                      arguments: {'data': '别名路由传参666'},
                    );
                  },
                ),
                Observer(
                  builder: (_) => Text(
                    '状态管理值：${_counter.value}',
                    style: Theme.of(context).textTheme.display1,
                  ),
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

  Widget _button(String text, {Function onPressed}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: RaisedButton(
        child: Text(
          text,
          style: TextStyle(fontSize: 26),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
