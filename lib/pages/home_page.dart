import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

/// App 首页入口
///
/// 本模块函数，加载状态类组件HomePageState
class HomePage extends StatefulWidget {
  final String prefix = '当前时间';

  @override
  createState() => HomePageState();
}

/// 首页有状态组件类
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
}
