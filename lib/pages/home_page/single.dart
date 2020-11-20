import 'package:flutter/material.dart';

import 'package:flutter_app_test/api/content/index.dart';
import 'package:flutter_app_test/widgets/home_page/single_bottom_summary.dart';
import 'package:flutter_app_test/widgets/home_page/single_like_bar.dart';
import 'package:flutter_app_test/widgets/home_page/single_right_bar.dart';

import 'package:flutter_app_test/util/struct/api_ret_info.dart';

import 'package:flutter_app_test/util/struct/content_detail_struct.dart';

/// 单个内容首页
class HomePageSingle extends StatefulWidget {
  /// 构造函数
  const HomePageSingle();

  @override
  createState() => HomePageSingleState();
}

/// 具体的state类
class HomePageSingleState extends State<HomePageSingle> {
  /// index position
  int indexPos;

  /// 首页推荐帖子列表
  List<ContentDetailStruct> contentList;

  @override
  void initState() {
    super.initState();
    indexPos = 0;
    // 拉取推荐内容
    setState(() {
      StructApiContentListRetInfo retInfo =
          ApiContentIndex().getRecommendList();

      contentList = retInfo.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(contentList[indexPos].articleImage),
          fit: BoxFit.contain
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          SingleRightBar(
            nickname: contentList[indexPos].userInfo.nickname,
            headerImage: contentList[indexPos].userInfo.headerUrl,
            commentNum: contentList[indexPos].commentNum,
          ),
          SingleLikeBar(
            articleId: contentList[indexPos].id,
            likeNum: contentList[indexPos].likeNum,
          ),
          SingleBottomSummary(
            articleId: contentList[indexPos].id,
            title: contentList[indexPos].title,
            summary: contentList[indexPos].summary,
          )
        ],
      ),
    );
  }
}