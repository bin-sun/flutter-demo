import 'package:flutter/material.dart';
import 'package:flutter_app_test/pages/home_page.dart';
import 'package:flutter_app_test/pages/test_stateful_widget.dart';

/// App 核心入口
void main() => runApp(MyApp());

/// App 核心入口界面
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Two You',
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
    );
  }
}
