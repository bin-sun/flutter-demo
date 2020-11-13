import 'package:flutter/material.dart';

/// likeNum 管理
/*class LikeNumModel with ChangeNotifier {
  /// 声明私有变量
  int _likeNum = 0;

  /// 设置get方法
  int get value => _likeNum;

  /// 点赞加一
  void like() {
    _likeNum++;
    notifyListeners();
  }
}*/

/// likeNum 管理
class LikeNumModel with ChangeNotifier {
  /// 声明私有变量
  Map<String, int> _likeInfo;

  /// 设置初始like num
  void setLikeNum(String articleId, int likeNum) {
    if (_likeInfo == null) {
      _likeInfo = {};
    }
    if (articleId == null) {
      return;
    }
    _likeInfo[articleId] = likeNum;
  }

  /// 设置get方法
  int getLikeNum(String articleId, [int likeNum = 0]){
    if (_likeInfo == null) {
      _likeInfo = {};
    }
    if (articleId == null) {
      return likeNum;
    }
    if (_likeInfo[articleId] == null) {
      _likeInfo[articleId] = likeNum;
    }

    return _likeInfo[articleId];
  }

  /// 点赞加一
  void like(String articleId) {
    if (_likeInfo == null || articleId == null) {
      _likeInfo = {};
    }
    if (_likeInfo == null || _likeInfo[articleId] == null) {
      _likeInfo[articleId] = 0;
    }
    _likeInfo[articleId] = _likeInfo[articleId] + 1;

    notifyListeners();
  }
}
