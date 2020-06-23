import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/common/values/values.dart';
import 'package:pingduoduo/common/widgets/widgets.dart';

class NavEntity {
  String path;
  String name;
  String imageUrl;

  NavEntity({this.path, this.name, this.imageUrl});

  NavEntity.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    name = json['name'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['path'] = this.path;
    data['name'] = this.name;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}

final List<NavEntity> navBarList = [
  NavEntity(
    path: "ceshi",
    name: "限时秒杀",
    imageUrl: "assets/images/weixin.png",
  ),
  NavEntity(
    path: "ceshi",
    name: "充值中心",
    imageUrl: "assets/images/weixin.png",
  ),
  NavEntity(
    path: "ceshi",
    name: "断码清仓",
    imageUrl: "assets/images/weixin.png",
  ),
  NavEntity(
    path: "ceshi",
    name: "医药馆",
    imageUrl: "assets/images/weixin.png",
  ),
  NavEntity(
    path: "ceshi",
    name: "新衣馆",
    imageUrl: "assets/images/weixin.png",
  ),
  NavEntity(
    path: "ceshi",
    name: "现金签到",
    imageUrl: "assets/images/weixin.png",
  ),
  NavEntity(
    path: "ceshi",
    name: "多多果园",
    imageUrl: "assets/images/weixin.png",
  ),
  NavEntity(
    path: "ceshi",
    name: "多多赚大钱",
    imageUrl: "assets/images/weixin.png",
  ),
  NavEntity(
    path: "ceshi",
    name: "9块9特卖",
    imageUrl: "assets/images/weixin.png",
  ),
  NavEntity(
    path: "ceshi",
    name: "砍价免费拿",
    imageUrl: "assets/images/weixin.png",
  ),
  NavEntity(
    path: "ceshi",
    name: "多多爱消除",
    imageUrl: "assets/images/weixin.png",
  ),
  NavEntity(
    path: "ceshi",
    name: "电器城",
    imageUrl: "assets/images/weixin.png",
  ),
  NavEntity(
    path: "ceshi",
    name: "天天领现金",
    imageUrl: "assets/images/weixin.png",
  ),
  NavEntity(
    path: "ceshi",
    name: "爱逛街",
    imageUrl: "assets/images/weixin.png",
  ),
  NavEntity(
    path: "ceshi",
    name: "省钱月卡",
    imageUrl: "assets/images/weixin.png",
  ),
  NavEntity(
    path: "ceshi",
    name: "每日好店",
    imageUrl: "assets/images/weixin.png",
  ),
];


class PopularProduct extends StatefulWidget {
  @override
  _PopularProductState createState() => _PopularProductState();
}

class _PopularProductState extends State<PopularProduct> with AutomaticKeepAliveClientMixin{
  ScrollController _scrollController;

  //这里有个坑，必须赋初始值
  ValueNotifier<double> _offsetRatio = ValueNotifier<double>(0);

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _scrollController = new ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      var position = _scrollController.position;
      _offsetRatio.value = position.pixels / position.maxScrollExtent;
    });

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildPingXiaoQuan(),
          SplitLine(),
          _buildNav(),
          SplitLine(),
          Container(
            width: double.infinity,
            height: 200.h,
            decoration: BoxDecoration(color: Colors.yellow),
            child: Text("百亿补贴"),
          ),
          SplitLine(),
          Container(
            width: double.infinity,
            height: 200.h,
            decoration: BoxDecoration(color: Colors.yellow),
            child: Text("百亿补贴"),
          ),
          Container(
            width: double.infinity,
            height: 200.h,
            decoration: BoxDecoration(color: Colors.yellow),
            child: Text("百亿补贴"),
          ),
          Container(
            width: double.infinity,
            height: 200.h,
            decoration: BoxDecoration(color: Colors.yellow),
            child: Text("百亿补贴"),
          ),
        ],
      ),
    );
  }

  // 导航
  Widget _buildNav() {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 250.h,
          child: GridView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 30.w,
              crossAxisCount: 2,
              crossAxisSpacing: 10.w,
            ),
            itemCount: navBarList.length,
            itemBuilder: (contxt, index) {
              return _buildNavItem(navBarList[index]);
            },
          ),
        ),
        ValueListenableBuilder(
          valueListenable: _offsetRatio,
          builder: (BuildContext context, double value, Widget child) {
            return Container(
              child: Center(
                child: CustomPaint(
                  painter: ScroolbarWidget(_offsetRatio.value),
                  size: Size(200.w, 10.h),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildNavItem(NavEntity item) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            item.imageUrl,
            height: 65.h,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            item.name,
            style: TextStyle(fontSize: 20.ssp),
          ),
        ],
      ),
    );
  }

  // 拼小圈
  Widget _buildPingXiaoQuan() {
    return Container(
      width: double.infinity,
      height: 100.h,
      child: GridTileBar(
          leading: Image.asset(
            "assets/images/weixin.png",
            height: 50.h,
          ),
          title: Text(
            "拼小圈",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
          ),
          trailing: Row(
            children: <Widget>[
              Text("查看好友动态"),
              Icon(
                Icons.keyboard_arrow_right,
                color: AppColors.thirdElement,
              )
            ],
          )),
    );
  }
}
