import 'package:flutter_app_test/util/struct/user_info.dart';

/// 获取用户接口信息
class ApiUserInfoIndex {
  /// 根据用户id拉取用户信息
  static UserInfoStructTwo getOneById(String id) {
    return UserInfoStructTwo('1001', '测试001',
        'https://i.pinimg.com/originals/1f/00/27/1f0027a3a80f470bcfa5de596507f9f4.png');
  }
}
