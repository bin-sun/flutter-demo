import 'package:flutter_app_test/api/user_info/index.dart';
import 'package:flutter_app_test/util/struct/content_detail_struct.dart';
import 'package:flutter_app_test/util/struct/user_info.dart';
import 'package:flutter_app_test/util/struct/api_ret_info.dart';
import 'package:flutter_app_test/util/tools/call_server.dart';

/// 获取内容详情接口
class ApiContentIndex {
  /// 根据内容id拉取内容详情
  ContentDetailStruct getOneById(String id) {
    ContentDetailStruct detailInfo = ContentDetailStruct(
      '1001',
      'hello test',
      'summary',
      '默认信息 ${id}',
      '1001',
      1,
      2,
      'http://1841.img.pp.sohu.com.cn/images/2011/9/23/15/17/u132152629_133524196e2g215_b.jpg',
    );
    UserInfoStructTwo userInfo = ApiUserInfoIndex.getOneById(detailInfo.uid);
    return ContentDetailStruct(
        detailInfo.uid,
        detailInfo.title,
        detailInfo.summary,
        detailInfo.detailInfo,
        detailInfo.uid,
        detailInfo.likeNum,
        detailInfo.commentNum,
        detailInfo.articleImage,
        userInfo: userInfo);
  }

  /// 拉取用户内容推荐帖子列表
  Future<StructApiContentListRetInfo> getRecommendList([lastId = null]) async {
    if (lastId != null) {
      Map<String, dynamic> retJson =
      await CallServer.get('recommendListNext', {lastId: lastId});

      return StructApiContentListRetInfo.fromJson(retJson);
    } else {
      Map<String, dynamic> retJson = await CallServer.get('recommendList');
      print('retJson------${retJson}');
      return StructApiContentListRetInfo.fromJson(retJson);
    }
  }

  /// 拉取用户关注的帖子列表
  Future<StructApiContentListRetInfo> getFollowList([lastId = null]) async {
    if (lastId != null) {
      Map<String, dynamic> retJson =
          await CallServer.get('followList', {lastId: lastId});

      return StructApiContentListRetInfo.fromJson(retJson);
    } else {
      Map<String, dynamic> retJson = await CallServer.get('followListNext');
      return StructApiContentListRetInfo.fromJson(retJson);
    }
  }
}
