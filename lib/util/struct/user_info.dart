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
}
