import '../../../components/PageLoding/PageLoding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/counterStore.p.dart';

class Home extends StatefulWidget {
  Home({Key key, this.params}) : super(key: key);
  final params;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  CounterStore _counter;

  @override
  void initState() {
    super.initState();
  }

  initFetch() async {
    // TODO: 接口获取数据
    return 'data';
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    _counter = Provider.of<CounterStore>(context); // 实例化类，可多页共享数据

    return Scaffold(
      appBar: AppBar(
        title: Text('home页面'),
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder(
        future: initFetch(),
        builder: (context, snap) {
          if (snap.data != null) {
            return contextWidget();
          }
          return PageLoading();
        },
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'homeBtn1',
        onPressed: () async {
          _counter.increment(); // 状态管理mobx中的值
        },
        tooltip: '加加store值',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget contextWidget() {
    return ListView(
      children: List.generate(1, (index) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _button(
                '点我去test页',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/testDemo',
                    arguments: {'data': '别名路由传参666'},
                  );
                },
              ),
              Consumer<CounterStore>(
                builder: (_, counterStore, child) {
                  return Text('状态管理值：${counterStore.value}');
                },
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _button(String text, {Function onPressed}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: RaisedButton(
        child: Text(
          text,
          style: TextStyle(fontSize: 22),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
