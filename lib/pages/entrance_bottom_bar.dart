import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';

import 'package:flutter_app_test/pages/search_page/custom_delegate.dart';
import 'package:flutter_app_test/widgets/menu/draw.dart';
import 'package:flutter_app_test/router.dart';

/// eum 类型
enum UniLinksType {
  /// string link
  string,
}

/// 项目页面入口文件
class Entrance extends StatefulWidget {
  /// 页面索引位置
  final int indexValue;

  /// 构造函数
  const Entrance({Key key, this.indexValue}) : super(key: key);

  @override
  _EntranceState createState() => _EntranceState();
}

/// entrance 状态类
///
/// 入口文件
class _EntranceState extends State<Entrance>
  with SingleTickerProviderStateMixin {
  int _indexNum = 0;

  UniLinksType _type = UniLinksType.string;
  StreamSubscription _sub;
  Router router = Router();

  @override
  void initState() {
    super.initState();
    // scheme初始化，保证有上下文，需要跳转页面
    initPlatformState();
    if(widget.indexValue !=null) {
      _indexNum = widget.indexValue;
    }
  }

  ///  初始化Scheme只使用了String类型的路由跳转
  ///  所以只有一个有需求可以使用[initPlatformStateForUriUniLinks]
  Future<void> initPlatformState() async {
    if (_type == UniLinksType.string) {
      await initPlatformStateForStringUniLinks();
    }
  }

  /// 使用[String]链接实现
  Future<void> initPlatformStateForStringUniLinks() async {
    String initialLink;

    try {
      initialLink = await getInitialLink();
      print('initialLink----- ${initialLink}');
      redirect(initialLink);
    } on PlatformException {
      initialLink = '无法获取初始链接';
    } on FormatException {
      initialLink = '无法将初始链接解析为uri';
    }

    _sub = getLinksStream().listen((String link) {
      if (!mounted || link == null) return;
      // 跳转到指定页面
      redirect(link);
    }, onError: (Object err) {
      if (!mounted) return;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (_sub != null) _sub.cancel();
  }

  @override
  void redirect(String link) {
    if (link == null) return;
    int indexNum = router.open(context, link);
    if (indexNum > -1 && _indexNum != indexNum) {
      setState(() {
        _indexNum = indexNum;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('测试flutter'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: SearchPageCustomDelegate());
            },
          )
        ],
      ),
      drawer: MenuDraw(redirect),
      body: Stack(
        children: <Widget>[
          _getPagesWidget(0),
          _getPagesWidget(1),
          _getPagesWidget(2),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('推荐'),
            activeIcon: Icon(Icons.people_outline),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('关注'),
            activeIcon: Icon(Icons.favorite_border),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('我'),
            activeIcon: Icon(Icons.person_outline),
          ),
        ],
        iconSize: 24,
        currentIndex: _indexNum,

        /// 选中后，底部BottomNavigationBar内容的颜色（选中时，默认为主题色）
        /// （仅当type: BottomNavigationBarType.fixed时生效
        fixedColor: Colors.lightBlueAccent,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          if (_indexNum != index) {
            setState(() {
              _indexNum = index;
            });
          }
        },
      ),
    );
  }

  /// 获取页面组件
  Widget _getPagesWidget(int index) {
    List<Widget> widgetList = [
      router.getPageByRouter('homepage'),
      Icon(Icons.directions_transit),
      router.getPageByRouter('userpage'),
    ];
    return Offstage(
      offstage: _indexNum != index,
      child: TickerMode(
        enabled: _indexNum == index,
        child: widgetList[index],
      ),
    );
  }
}
