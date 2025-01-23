import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/update_app/check_app_version.dart';
import '../../../routes/route_name.dart';
import '../../../config/app_env.dart' show appEnv;
import '../../../services/common_service.dart';
import 'provider/counterStore.p.dart';

class Home extends StatefulWidget {
  const Home({Key? key, this.params}) : super(key: key);
  final dynamic params;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  late CounterStore _counter;
  FocusNode blankNode = FocusNode(); // 响应空白处的焦点的Node

  @override
  Widget build(BuildContext context) {
    super.build(context);
    _counter = Provider.of<CounterStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('home页面'),
        automaticallyImplyLeading: false,
      ),
      body: GestureDetector(
        onTap: () {
          // 点击空白页面关闭键盘
          FocusScope.of(context).requestFocus(blankNode);
        },
        child: contextWidget(),
      ),
    );
  }

  Widget contextWidget() {
    return ListView(
      children: List.generate(1, (index) {
        return Column(
          children: <Widget>[
            Text('App渠道：${appEnv.getAppChannel()}'),
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
            _button(
              '强制更新App',
              onPressed: () {
                checkAppVersion(forceUpdate: true);
              },
            ),
            _button(
              _counter.fetchResult.isNotEmpty
                  ? _counter.fetchResult
                  : '请求demo接口',
              icon: _counter.isLoading
                  ? const SizedBox(
                      width: 12.0,
                      height: 12.0,
                      child: CircularProgressIndicator(),
                    )
                  : const SizedBox.shrink(),
              onPressed: () {
                getFetchFn();
              },
            ),
          ],
        );
      }),
    );
  }

  getFetchFn() async {
    _counter.setLoading(true);
    var res = await getDemo() as Map<String, dynamic>;
    _counter.setLoading(false);
    _counter.setFetchResult(res['data']['name']);
  }

  Widget _button(String text, {VoidCallback? onPressed, Widget? icon}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        label: Text(
          text,
          style: TextStyle(fontSize: 22.sp),
        ),
        icon: icon,
      ),
    );
  }
}
