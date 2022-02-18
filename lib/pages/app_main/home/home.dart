import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../routes/routeName.dart';
import 'provider/counterStore.p.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  @override
  Widget build(BuildContext context) {
    super.build(context);
    _counter = Provider.of<CounterStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('home页面'),
        automaticallyImplyLeading: false,
      ),
      body: contextWidget(),
    );
  }

  Widget contextWidget() {
    return ListView(
      children: List.generate(1, (index) {
        return Container(
          child: Column(
            children: <Widget>[
              _button(
                '跳转test页',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RouteName.testDemo,
                    arguments: {'data': '别名路由传参666'},
                  );
                },
              ),
              Text('状态管理值：${context.watch<CounterStore>().value}'),
              _button(
                '加+',
                onPressed: () {
                  _counter.increment();
                },
              ),
              _button(
                '减-',
                onPressed: () {
                  _counter.decrement();
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
      child: ElevatedButton(
        child: Text(
          text,
          style: TextStyle(fontSize: 22.sp),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
