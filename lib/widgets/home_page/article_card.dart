import 'package:flutter/material.dart';

import 'package:flutter_app_test/util/struct/article_summary_struct.dart';
import 'package:flutter_app_test/util/struct/user_info_struct.dart';

import 'package:flutter_app_test/widgets/home_page/article_bottom_bar.dart';
import 'package:flutter_app_test/widgets/home_page/article_like_bar.dart';
import 'package:flutter_app_test/widgets/home_page/article_summary.dart';

/// 此为帖子描述类，包括了帖子UI中的所有元素
class ArticleCard extends StatelessWidget {
  /// 传入用户信息
  final UserInfoStruct userInfo;

  /// 传入帖子信息
  final ArticleSummaryStruct articleInfo;

  /// 构造函数
  const ArticleCard({Key key, this.userInfo, this.articleInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        ArticleSummary(
          title: articleInfo.title,
          summary: articleInfo.summary,
          articleImage: articleInfo.articleImage,
        ),
        Row(
          children: <Widget>[
            ArticleBottomBar(
              nickname: userInfo.nickname,
              headerImg: userInfo.headerImage,
              commentNum: articleInfo.commentNum,
            ),
            ArticleLikeBar(
              likeNum: articleInfo.likeNum,
            )
          ],
        )
      ],
    );
  }
}
