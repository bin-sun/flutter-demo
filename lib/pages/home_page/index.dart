import 'package:flutter/material.dart';

import 'package:flutter_app_test/api/content/index.dart';
import 'package:flutter_app_test/widgets/common/loading.dart';
import 'package:flutter_app_test/widgets/home_page/article_card.dart';
import 'package:flutter_app_test/util/struct/content_detail_struct.dart';
import 'package:flutter_app_test/util/struct/api_ret_info.dart';

import 'package:flutter_app_test/widgets/common/error.dart';
import 'package:flutter_app_test/widgets/common/loading.dart';

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

  /// 列表事件监听
  ScrollController scrollController = ScrollController();

  /// 是否在下一页
  bool hasMore;

  /// 页面是否正在加载
  bool isLoading;

  /// 最后一个数据 id
  String lastId;

  /// 是否接口报错
  bool error = false;

  @override
  void initState() {
    super.initState();

    /// 拉取首页接口数据
    setFirstPage();

    /// 监听上滑事件
    this.scrollController.addListener(() {
      if (!hasMore) {
        return;
      }
      if (!isLoading &&
          scrollController.position.pixels >=
        scrollController.position.maxScrollExtent) {
        isLoading = true;
        loadMoreDate();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    this.scrollController.dispose();
  }

  /// 加载下一页
  void loadMoreDate() {
    StructApiContentListRetInfo retInfo =
        ApiContentIndex().getRecommendList(lastId);
    if (retInfo.ret != 0) {
      return;
    }
    List<ContentDetailStruct> netList = retInfo.data;

    setState(() {
      error = false;
      isLoading = false;
      hasMore = retInfo.hasMore;
      contentList.addAll(netList);
    });
  }

  /// 处理刷新操作
  Future onRefresh() {
    return Future.delayed(Duration(seconds: 1), () {
      setFirstPage();
    });
  }

  /// 处理首次拉取和刷新数据获取动作
  void setFirstPage() {
    print('122');
    StructApiContentListRetInfo retInfo = ApiContentIndex().getRecommendList();
    setState(() {
      if (retInfo.ret != 0) {
        // 判断是否返回正确
        error = true;
        return;
      }

      error = false;
      contentList = retInfo.data;
      hasMore = retInfo.hasMore;
      isLoading = false;
      lastId = retInfo.lastId;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (error) {
      return CommonError(action: this.setFirstPage);
    }
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        controller: scrollController,
        shrinkWrap: true,
        itemCount: contentList.length + 1,
        itemBuilder: (BuildContext content, int position){
          if (position < this.contentList.length) {
            return ArticleCard(articleInfo: contentList[position]);
          }
          return CommonLoadingButton(loadingState: isLoading, hasMore: hasMore);
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: .5,
            //indent: 75,
            color: Color(0xFFDDDDDD),
          );
        },
      ),
    );
  }
}
