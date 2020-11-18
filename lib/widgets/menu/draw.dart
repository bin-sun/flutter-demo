import 'package:flutter/material.dart';

import 'package:flutter_app_test/router.dart';

/// 左侧菜单
class MenuDraw extends StatelessWidget {
  /// 外部跳转
  final Function redirect;

  /// 默认构造函数
  const MenuDraw(this.redirect);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.view_list),
                title: Text('推荐'),
                onTap: () {
                  Navigator.pop(context);
                  redirect('tyapp://imgflow');
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text('关注'),
                onTap: () {
                  Navigator.pop(context);
                  Router().open(context, 'tyapp://singlepage');
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('我'),
                onTap: () {
                  Navigator.pop(context);
                  redirect('tyfapp://userpage');
                },
              )
            ],
          )),
    );
  }
}
