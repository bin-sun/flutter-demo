import 'package:flutter/material.dart';

import 'package:flutter_app_test/api/content/index.dart';
import 'package:flutter_app_test/widgets/home_page/article_card.dart';
import 'package:flutter_app_test/util/struct/content_detail_struct.dart';

/// 首页
class HomePageIndex extends StatefulWidget {
  /// 构造函数
  const HomePageIndex();

  @override
  createState() => HomePageIndexState();
}

class HomePageIndexState extends State<HomePageIndex> {
  /// 首页推荐帖子列表
  List<ContentDetailStruct> contentList;

  @override
  void initState() {
    super.initState();
    // 拉取推荐内容
    setState(() {
      contentList = ApiContentIndex().getRecommendList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: contentList.length,
      itemBuilder: (BuildContext content, int position){
        return ArticleCard(articleInfo: this.contentList[position]);
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: .5,
          //indent: 75,
          color: Color(0xFFDDDDDD),
        );
      },
    );
  }
}
