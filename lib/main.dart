import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_test/router.dart';

import 'package:flutter_app_test/model/like_num_model.dart';
import 'package:flutter_app_test/model/new_message_model.dart';
import 'package:flutter_app_test/model/user_info_model.dart';
import 'package:flutter_app_test/api/user_info/index.dart';
import 'package:flutter_app_test/api/user_info/message.dart';
import 'package:flutter_app_test/util/struct/user_info.dart';
import 'package:flutter_app_test/widgets/common/error.dart';

// import 'package:flutter_app_test/pages/entrance_top_bar.dart';
import 'package:flutter_app_test/pages/entrance_bottom_bar.dart';

/// App 核心入口
void main() => runApp(MyApp());

/// App 核心入口界面
class MyApp extends StatelessWidget {
  /// like num data
  final likeNumModel = LikeNumModel();

  @override
  Widget build(BuildContext context) {
    // print('likeNumModel---------${likeNumModel}');
    return _getProviders(
        context,
        MaterialApp(
          title: 'flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: Router().registerRouter(),
          home: Entrance(),
        )
    );
    // return Provider<Map<String, int>>.value(
    //     value: {},
    //     child: ChangeNotifierProvider.value(
    //       value: likeNumModel,
    //       child: MaterialApp(
    //         title: 'flutter Demo',
    //         debugShowCheckedModeBanner: false,
    //         theme: ThemeData(
    //           primarySwatch: Colors.blue
    //         ),
    //         routes: Router().registerRouter(),
    //         home: Entrance(),
    //       ),
    //     ),
    //     );
  }

  /// 部分数据需要获取初始值
  Widget _getProviders(BuildContext context, Widget child) {
    UserInfoStructTwo myUserInfo = ApiUserInfoIndex.getSelfUserInfo();
    if (myUserInfo == null) {
      return CommonError();
    }
    int unReadMessageNum = ApiUserInfoMessage.getUnReadMessageNum();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LikeNumModel()),
        ChangeNotifierProvider(
          create: (context) => UserInfoModel(myUserInfo: myUserInfo),
        ),
        ChangeNotifierProvider(
          create: (context) =>
            NewMessageModel(newMessageNum: unReadMessageNum),
        )
      ],
      child: child,
    );
  }
}

/// App 核心入口界面
// class MyApp extends StatelessWidget {
//   /// 创建like model
//   final likeNumModel = LikeNumModel();
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Provider<int>.value(
//       child: ChangeNotifierProvider.value(
//           value: likeNumModel,
//           child: MaterialApp(
//             title: 'To You',
//             debugShowCheckedModeBanner: false, // 调试显示检查模式横幅
//             theme: ThemeData(
//               primarySwatch: Colors.blue,
//             ),
//             home: Scaffold(
//               appBar: AppBar(
//                 title: Text('你好 Flutter'),
//               ),
//               body: Center(
//                 child: HomePage(),
//               ),
//             ),
//           )),
//     );
//   }
// }
