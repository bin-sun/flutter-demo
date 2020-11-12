import 'package:flutter/material.dart';

import 'package:flutter_app_test/util/tools/json_config.dart';

/// 首页
class UserPageIndex extends StatelessWidget {
  /// 用户 ID 信息
  final String userId;

  /// 构造函数
  const UserPageIndex({Key key, this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*获取传递过来的参数*/
    Object _people = ModalRoute.of(context).settings.arguments;

    print('_people------- ${_people}');
    String myUserId = userId;
    if (ModalRoute.of(context).settings.arguments != null) {
      Map dataInfo =
          JsonConfig.objectToMap(ModalRoute.of(context).settings.arguments);
      myUserId = dataInfo['userId'].toString();
    }

    // TODO: implement build
    return Text('个人中心 ${myUserId}');
  }
}
