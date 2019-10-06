import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
// 以下这二段代码是必要的，后面输入命令生成文件所需要
part 'counterStore.g.dart'; // 和文件名同称

class CounterStore = _CounterStore with _$CounterStore; // Counter为以后声明的数据类型

abstract class _CounterStore with Store {
  @observable
  int value = 10;

  // 自定义方法，处理store中的值（根据业务来）
  @action
  void increment() {
    value++;
  }

  @action
  void decrement() {
    value--;
  }

  @action
  void set(int value) {
    this.value = value;
  }

  // 声明异步方法请求，然后更新数据
  @action
  Future<void> fetchData() async {
    final response =
        await http.get('http://yapi.demo.qunar.com/mock/1311/data');
    var json = jsonDecode(response.body);
    print(json['num']);
    value = json['num'];
  }
}
