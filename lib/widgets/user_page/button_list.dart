import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app_test/model/new_message_model.dart';
import 'package:flutter_app_test/widgets/common/red_message.dart';

/// 个人页面的功能列表
class UserPageButtonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final newMessageModel = Provider.of<NewMessageModel>(context);

    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.person_pin),
          title: Text('我的好友'),
          onTap: () {},
        ),
        ListTile(
          leading: CommonRedMessage.showRedNumWidget(
            Icon(Icons.email),
            newMessageModel.value
          ),
          title: Text('我的消息'),
          onTap: () {
            newMessageModel.readNewMessage();
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('系统设置'),
          onTap: () {},
        )
      ],
    );
  }
}