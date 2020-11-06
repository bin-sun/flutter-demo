import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app_test/model/like_num_model.dart';
import 'package:flutter_app_test/pages/home_page.dart';
// import 'package:flutter_app_test/pages/test_stateful_widget.dart';

/// App 核心入口
void main() => runApp(MyApp());

/// App 核心入口界面
class MyApp extends StatelessWidget {
  /// 创建like model
  final likeNumModel = LikeNumModel();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Provider<int>.value(
      child: ChangeNotifierProvider.value(
          value: likeNumModel,
          child: MaterialApp(
            title: 'To You',
            debugShowCheckedModeBanner: false, // 调试显示检查模式横幅
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: Scaffold(
              appBar: AppBar(
                title: Text('你好 Flutter'),
              ),
              body: Center(
                child: HomePage(),
              ),
            ),
          )),
    );
    // return MaterialApp(
    //   title: 'Two You',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: Scaffold(
    //     appBar: AppBar(
    //       title: Text('你好 Flutter'),
    //     ),
    //     body: Center(
    //       child: HomePage(),
    //     ),
    //   ),
    // );
  }
}
