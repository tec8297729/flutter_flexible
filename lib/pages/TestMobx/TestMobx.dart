import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:flexible/pages/Home/model/counterStore/counterStore.dart';

class TestMobx extends StatefulWidget {
  TestMobx({Key key, this.params}) : super(key: key);
  final params;

  @override
  _TestMobxState createState() => _TestMobxState();
}

class _TestMobxState extends State<TestMobx>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  CounterStore _counter;
  @override
  void initState() {
    super.initState();
    print(widget.params);
  }

  void _incrementCounter() {
    _counter.increment(); // mobx中的值 加加value
    // if (Navigator.canPop(context)) {
    //   Navigator.popUntil(context, ModalRoute.withName('/'));
    // }
    // Navigator.of(context).pushNamed('/');
    print(ModalRoute.of(context).settings);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                    '状态共享值：${_counter.value}',
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
        onPressed: _incrementCounter,
        tooltip: '增加mobx中的值',
        child: Icon(Icons.add),
      ), //
    );
  }
}
