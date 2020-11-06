import 'package:flutter/material.dart';

import 'package:flutter_app_test/util/struct/article_summary_struct.dart';
import 'package:flutter_app_test/util/struct/comment_info_struct.dart';
import 'package:flutter_app_test/util/struct/user_info_struct.dart';

import 'package:flutter_app_test/widgets/article_detail/article_comments.dart';
import 'package:flutter_app_test/widgets/article_detail/article_content.dart';
import 'package:flutter_app_test/widgets/article_detail/article_detail_like.dart';

class ArticleDetail extends StatelessWidget {
  /// 帖子概要描述信息
  final ArticleSummaryStruct articleInfo = ArticleSummaryStruct(
      '帖子详情',
      '我是一个小可爱，很长的一个测试看看效果，会换行吗',
      'https://i.pinimg.com/originals/e0/64/4b/e0644bd2f13db50d0ef6a4df5a756fd9.png',
      20,
      30,
      '我是一个小可爱，很长的一个测试看看效果，会换行吗?\n你好我是详情');

  final List<CommentInfoStruct> commentList = [
    CommentInfoStruct(
        UserInfoStruct('flutter',
            'https://i.pinimg.com/originals/1f/00/27/1f0027a3a80f470bcfa5de596507f9f4.png'),
        'ts1'),
    CommentInfoStruct(
        UserInfoStruct('flutter',
            'https://i.pinimg.com/originals/1f/00/27/1f0027a3a80f470bcfa5de596507f9f4.png'),
        'ts2'),
    CommentInfoStruct(
        UserInfoStruct('flutter',
            'https://i.pinimg.com/originals/1f/00/27/1f0027a3a80f470bcfa5de596507f9f4.png'),
        'ts3'),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(articleInfo.title), // 页面名字
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ArticleContent(content: articleInfo.content),
            ArticleDetailLike(),
            ArticleComments(
              commentList: commentList,
            )
          ],
        ),
      ),
    );
  }
}
