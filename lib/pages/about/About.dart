import 'package:flutter/material.dart';

import '../../utils/tool/log_util.dart';

class About extends StatefulWidget{
  const About({super.key, this.params});
final dynamic params;

@override
State<About> createState() => _AboutState();

}

class _AboutState extends State<About>{
  @override
  void initState() {
    super.initState();
    LogUtil.d(widget.params);
  }
  @override
Widget build(BuildContext context){
    return Column(
      children: [
        Text('about'),
        Text(
          '路由接收参数》》${widget.params}',
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
}
}