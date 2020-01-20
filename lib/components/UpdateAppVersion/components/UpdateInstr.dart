import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateInstr extends StatelessWidget {
  UpdateInstr({@required this.data});
  final List<String> data;

  @override
  Widget build(BuildContext context) {
    int len = data?.length ?? 0;
    return Container(
      height: ScreenUtil().setHeight(310),
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          for (var i = 0; i < len; i++)
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                '${i + 1}、${data[i]}',
                style: TextStyle(fontSize: ScreenUtil().setSp(28)),
              ),
            ),
        ],
      ),
    );
  }
}
