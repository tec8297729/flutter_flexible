import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../app_main/home/provider/counterStore.p.dart';
import '../../utils/index.dart';

class TestDemo extends StatefulWidget {
  const TestDemo({Key? key, this.params}) : super(key: key);
  final dynamic params;

  @override
  State<TestDemo> createState() => _TestDemoState();
}

class _TestDemoState extends State<TestDemo> {
  late CounterStore _counter;
  @override
  void initState() {
    super.initState();
    LogUtil.d(widget.params);
  }

  @override
  Widget build(BuildContext context) {
    _counter = Provider.of<CounterStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test页面'),
      ),
      body: ListView(
        children: List.generate(1, (index) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Consumer<CounterStore>(
                  builder: (_, counterStore, child) => Text(
                    '状态共享值：${counterStore.value}',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                Text(
                  '路由接收参数》》${widget.params}',
                  style: const TextStyle(fontSize: 18),
                ),
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
      ), //
    );
  }

  Widget _button(String text, {VoidCallback? onPressed}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: 22.sp),
        ),
      ),
    );
  }
}
