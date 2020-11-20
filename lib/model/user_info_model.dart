import 'package:flutter/material.dart';

import 'package:flutter_app_test/util/struct/user_info.dart';

/// name状态管理模块
class UserInfoModel with ChangeNotifier {
  /// 系统用户个人信息
  final UserInfoStructTwo myUserInfo;

  /// 构造函数
  UserInfoModel({this.myUserInfo});

  /// 获取用户信息
  UserInfoStructTwo get value => myUserInfo;
}