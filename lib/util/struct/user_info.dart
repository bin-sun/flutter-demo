/// 用户信息
///
/// {
///   "nickname" : "string",
///   "headerUrl" : "string",
///   "uid" : "string"
/// }
class UserInfoStructTwo {
  /// 标题
  final String nickname;

  /// 简要
  final String headerUrl;

  /// 主要内容
  final String uid;

  /// 默认构造函数
  const UserInfoStructTwo(this.uid, this.nickname, this.headerUrl);


  /// 将json数据转化为对象数据
  UserInfoStructTwo.fromJson(Map<String, dynamic> json)
      : uid = json['uid'] as String,
        headerUrl = json['headerUrl'] as String,
        nickname = json['nickName'] as String;

  /// 将对象转化为json数据
  static Map<String, dynamic> toJson(UserInfoStructTwo userInfo) => {
    'uid': userInfo.uid,
    'headerUrl': userInfo.headerUrl,
    'nickName': userInfo.nickname
  };
}
