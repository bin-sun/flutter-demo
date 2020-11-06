import 'package:flutter/material.dart';

/// likeNum 管理
class LikeNumModel with ChangeNotifier {
  /// 声明私有变量
  int _likeNum = 0;

  /// 设置get方法
  int get value => _likeNum;

  /// 点赞加一
  void like() {
    _likeNum++;
    notifyListeners();
  }
}
