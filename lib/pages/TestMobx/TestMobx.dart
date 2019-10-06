import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:flexible/stores/counterStore/counterStore.dart'; // 状态管理

class TestMobx extends StatefulWidget {
  TestMobx({Key key, this.params}) : super(key: key);
  final params;

  @override
  _TestMobxState createState() => _TestMobxState();
}

class _TestMobxState extends State<TestMobx> {
  CounterStore _counter;
  Timer _timer;
  @override
  void initState() {
    super.initState();
    print(widget.params);
  }

  void _incrementCounter() {
    _counter.increment(); // mobx中的值 加加value

    if (_timer != null) {
      _timer.cancel(); // 取消定时器
      _timer = null; // 清空
    }
    _timer = Timer(Duration(seconds: 2), () {
      Navigator.pushNamed(context, '/', arguments: {'pageId': 1});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _counter = Provider.of<CounterStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('TestMobx页面'),
      ),
      body: ListView(
        children: List.generate(1, (index) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'mobx共享值测试',
                  style: TextStyle(fontSize: 32),
                ),
                Observer(
                  builder: (_) => Text(
                    '${_counter.value}',
                    style: Theme.of(context).textTheme.display1,
                  ),
                )
              ],
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: '增加mobx中的值，并且跳转去hot页面',
        child: Icon(Icons.arrow_back_ios),
      ), //
    );
  }
}
