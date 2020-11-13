import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app_test/model/like_num_model.dart';
import 'package:flutter_app_test/styles/text_styles.dart';

/// 帖子文章赞组件
///
/// 包括点赞组件icon，以及组件点击效果
/// 需要外部参数[likeNum]，点赞数量
class ArticleLikeBar extends StatelessWidget {
  /// 帖子id
  final String articleId;

  /// like num
  final int likeNum;

  /// 构造函数
  const ArticleLikeBar({Key key, this.articleId, this.likeNum})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final likeNumModel = Provider.of<LikeNumModel>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          child: Row(
            children: <Widget>[
              Icon(Icons.thumb_up, color: Colors.grey, size: 18),
              Padding(padding: EdgeInsets.only(left: 10)),
              Text(
                '${likeNumModel.getLikeNum(articleId, likeNum)}',
                style: TextStyles.commonStyle(),
              ),
            ],
          ),
          onPressed: () => likeNumModel.like(articleId),
        ),
      ],
    );
  }
}

// class ArticleLikeBarState extends State<ArticleLikeBar> {
//   /// 状态 state
//   int likeNum;
//
//   @override
//   void initState() {
//     super.initState();
//     likeNum ??= widget.likeNum;
//   }
//
//   /// 点赞动作效果，点击后[likeNum]加1
//   void like() {
//     setState(() {
//       likeNum = ++likeNum;
//     });
//   }
//
//   /// 有状态组件返回信息
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Row(
//       children: <Widget>[
//         // Icon(
//         //   Icons.thumb_up,
//         //   color: Colors.grey,
//         //   size: 18,
//         // ),
//         // Padding(padding: EdgeInsets.only(left: 1)),
//         IconButton(
//           icon: Icon(Icons.thumb_up),
//           onPressed: () => like(),
//         ),
//         Text('$likeNum'),
//       ],
//     );
//   }
// }
