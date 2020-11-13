import 'package:flutter/material.dart';
import 'package:flutter_app_test/api/content/index.dart';

import 'package:flutter_app_test/util/struct/article_summary_struct.dart';
import 'package:flutter_app_test/util/struct/content_detail_struct.dart';
import 'package:flutter_app_test/util/struct/user_info_struct.dart';
import 'package:flutter_app_test/util/tools/json_config.dart';

import 'package:flutter_app_test/widgets/article_detail/article_comments.dart';
import 'package:flutter_app_test/widgets/article_detail/article_content.dart';
import 'package:flutter_app_test/widgets/article_detail/article_detail_like.dart';

class ArticleDetailIndex extends StatelessWidget {
  /// 帖子id
  final String articleId;

  /// 构造函数
  const ArticleDetailIndex ({Key key, this.articleId})
  : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String id = articleId;
    if (articleId == null &&
        ModalRoute.of(context).settings.arguments != null) {
      Map dataInfo =
          JsonConfig.objectToMap(ModalRoute.of(context).settings.arguments);
      id = dataInfo['articleId'].toString();
    }
    if (id == null) {
      return Text('error');
    }

    ContentDetailStruct articleInfo = ApiContentIndex().getOneById(id);

    return Column(
      children: <Widget>[
        ArticleContent(content: articleInfo.detailInfo),
        ArticleDetailLike(articleId: id, likeNum: articleInfo.likeNum),
        ArticleComments(commentList: [],)
      ],
    );
  }
}