import 'package:flutter/material.dart';
import 'package:flutter_app_test/pages/sub_stateful_widget.dart';

/// 创建有状态测试组件
class TestStatefulWidget extends StatefulWidget {
  @override
  createState() {
    print('create state');
    return TestState();
  }
}

/// 创建状态管理类，继承状态测试组件
class TestState extends State<TestStatefulWidget> {
  int count = 1;
  String name = 'test';
  @override
  void initState() {
    // TODO: implement initState
    print('init state');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    print('did change dependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(TestStatefulWidget oldWidget) {
    // TODO: implement didUpdateWidget
    count++;
    print('did update widget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    print('deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print('dispose');
    super.dispose();
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    print('reassemble');
    super.reassemble();
  }

  void changeName() {
    setState(() {
      print('set state');
      this.name = 'flutter';
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('build');
    return Column(
      children: <Widget>[
        FlatButton(
          child: Text('$name $count'),
          onPressed: () => this.changeName(),
        ),
//        SubStatefulWidget(),
      ],
    );
  }
}
