import 'package:flutter_app_test/util/struct/user_info.dart';

/// 获取用户接口信息
class ApiUserInfoIndex {
  /// 根据用户id拉取用户信息
  static UserInfoStructTwo getOneById(String id) {
    return UserInfoStructTwo('1001', '测试001',
        'http://ww1.sinaimg.cn/large/c1eff04ely1gkumqqni3gj2069069746.jpg');
  }
  /// 根据用户id拉取用户信息
  static UserInfoStructTwo getSelfUserInfo() {
    return UserInfoStructTwo('007', '测试001',
        'http://ww1.sinaimg.cn/large/c1eff04ely1gkumqqni3gj2069069746.jpg');
  }
}
