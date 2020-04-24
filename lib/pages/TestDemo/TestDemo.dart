import '../../utils/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../AppHomePage/Home/provider/counterStore.p.dart';

class TestDemo extends StatefulWidget {
  TestDemo({Key key, this.params}) : super(key: key);
  final params;

  @override
  _TestDemoState createState() => _TestDemoState();
}

class _TestDemoState extends State<TestDemo> {
  CounterStore _counter;
  @override
  void initState() {
    super.initState();
    LogUtil.d(widget.params);
  }

  void _incrementCounter() {
    _counter.increment(); // mobx中的值 加加value
  }

  @override
  Widget build(BuildContext context) {
    _counter = Provider.of<CounterStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Test页面'),
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
                Consumer<CounterStore>(
                  builder: (_, counterStore, child) => Text(
                    '状态共享值：${counterStore.value}',
                    style: Theme.of(context).textTheme.display1,
                  ),
                ),
                Text(
                  '路由接收参数》》${widget.params}',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'testDemoBtn1',
        onPressed: _incrementCounter,
        tooltip: '增加mobx中的值',
        child: Icon(Icons.add),
      ), //
    );
  }
}
