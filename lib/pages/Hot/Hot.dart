import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:flexible/stores/counterStore/counterStore.dart'; // 状态管理

class Hot extends StatefulWidget {
  Hot({Key key, this.params}) : super(key: key);
  final params;

  @override
  _HotState createState() => _HotState();
}

class _HotState extends State<Hot> {
  CounterStore _counter;
  Timer _timer;
  @override
  void initState() {
    super.initState();
    print(widget.params);
  }

  void _incrementCounter() {
    _counter.increment(); // mobx中的值 加加value

    try {
      _timer = Timer(Duration(seconds: 3), () {
        print('定时器');
        Navigator.pushNamed(context, '/', arguments: {'pageId': 5});
      });
    } catch (e) {}
  }

  @override
  void dispose() {
    _timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _counter = Provider.of<CounterStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('hot页面'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: List.generate(1, (index) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'mobx共享值(hot)',
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
        tooltip: 'Increment',
        child: Icon(Icons.import_contacts),
      ), //
    );
  }
}
