import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'dart:async';

import 'package:flutter_app_test/util/struct/article_summary_struct.dart';
import 'package:flutter_app_test/util/struct/user_info_struct.dart';

import 'package:flutter_app_test/widgets/common/banner_info.dart';
import 'package:flutter_app_test/widgets/home_page/article_card.dart';

/// App 首页入口
///
/// 本模块函数，加载状态类组件HomePageState
// class HomePage extends StatefulWidget {
//   final String prefix = '当前时间是';
//
//   @override
//   createState() => HomePageState();
// }

/*/// 首页有状态组件类
///
/// 主要是获取当前时间，并动态展示当前时间
class HomePageState extends State<HomePage> {
  /// 展示当前时间字符串
  String currentTimeStr;

  @override
  void initState() {
    super.initState();
    this.currentTimeStr = getCurrentTime();
    refreshTimeStr();
  }

  /// 更新当前时间字符串
  ///
  /// 每500ms更新一次，使用Timer
  void refreshTimeStr() {
    const period = Duration(milliseconds: 500);
    /// 定时更新当前时间的 currentTimeStr 字符串
    Timer.periodic(period, (timer) {
      setState(() {
        this.currentTimeStr = getCurrentTime();
      });
    });
  }

  /// 获取当前时间戳
  ///
  /// [prefix]需要传入一个前缀信息
  /// 返回一个字符串类型的前缀信息：时间戳
  String getCurrentTime() {
    DateTime now = DateTime.now();
    var formatter = DateFormat('yy-MM-dd HH:mm:ss');
    String nowTime = formatter.format(now);
    return nowTime;
  }

  /// 有状态类返回组件信息
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(widget.prefix),
        Text(this.currentTimeStr)
      ],
    );
  }
}*/

class HomePage extends StatelessWidget {
  /// banner 地址信息
  final String bannerImage =
      'https://img.089t.com/content/20200227/osbbw9upeelfqnxnwt0glcht.jpg';

  /// 帖子标题
  final UserInfoStruct userInfo = UserInfoStruct('作者',
      'https://i.pinimg.com/originals/1f/00/27/1f0027a3a80f470bcfa5de596507f9f4.png');

  /// 帖子概要描述信息
  final ArticleSummaryStruct articleInfo = ArticleSummaryStruct(
      '你好，交个朋友',
      '我是一个小可爱',
      'https://i.pinimg.com/originals/e0/64/4b/e0644bd2f13db50d0ef6a4df5a756fd9.png',
      20,
      30);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          BannerInfo(bannerImage: bannerImage),
          ArticleCard(
            userInfo: userInfo,
            articleInfo: articleInfo,
          )
        ],
      ),
    );
  }
}
