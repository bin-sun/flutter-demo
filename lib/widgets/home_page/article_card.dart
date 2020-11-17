import 'package:flutter/material.dart';

import 'package:flutter_app_test/router.dart';
import 'package:flutter_app_test/util/struct/content_detail_struct.dart';

import 'package:flutter_app_test/widgets/home_page/article_bottom_bar.dart';
import 'package:flutter_app_test/widgets/home_page/article_like_bar.dart';
import 'package:flutter_app_test/widgets/home_page/article_summary.dart';

/// 此为帖子描述类，包括了帖子UI中的所有元素
class ArticleCard extends StatelessWidget {
  /// 传入用户信息
  // final UserInfoStruct userInfo;

  /// 传入帖子信息
  final ContentDetailStruct articleInfo;

  /// 构造函数
  const ArticleCard({Key key, this.articleInfo}) : super(key: key);

  /// 执行页面跳转到article_detail
  void goToArticleDetailPage(BuildContext context, String articleId) {
    print('articleId ------------- ${articleId}');
    Router().open(context, "tyapp://contentpage?articleId=${articleId}");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(8),
      child: FlatButton(
        onPressed: () => goToArticleDetailPage(context, articleInfo.id),
        child: Column(
          children: <Widget>[
            ArticleSummary(
              title: articleInfo.title,
              summary: articleInfo.summary,
              articleImage: articleInfo.articleImage,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 9,
                  child: ArticleBottomBar(
                    nickname: articleInfo.userInfo.nickname,
                    headerImage: articleInfo.userInfo.headerUrl,
                    commentNum: articleInfo.commentNum,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: ArticleLikeBar(
                    articleId: articleInfo.id,
                    likeNum: articleInfo.likeNum,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );

    // return Column(
    //   children: <Widget>[
    //     ArticleSummary(
    //       title: articleInfo.title,
    //       summary: articleInfo.summary,
    //       articleImage: articleInfo.articleImage,
    //     ),
    //     Row(
    //       children: <Widget>[
    //         ArticleBottomBar(
    //           nickname: userInfo.nickname,
    //           headerImg: userInfo.headerImage,
    //           commentNum: articleInfo.commentNum,
    //         ),
    //         ArticleLikeBar()
    //       ],
    //     )
    //   ],
    // );
  }
}
