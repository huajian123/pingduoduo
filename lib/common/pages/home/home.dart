import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/common/pages/home/tab_pages/popular_product.dart';
import 'package:pingduoduo/common/utils/utils.dart';
import 'package:pingduoduo/common/values/values.dart';
import 'package:pingduoduo/common/widgets/widgets.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _tabController;

  // 搜索框
  Widget _buildSearch() {
    return DefaultTextStyle(
      style: TextStyle(color: AppColors.placeholderColor),
      child: Container(
        height: 70.h,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 30.w),
        decoration: BoxDecoration(
            borderRadius: new BorderRadius.circular(10.0),
            color: AppColors.secondaryElement),
        child: Stack(
          children: <Widget>[
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Baseline(
                    baseline: 48.h,
                    baselineType: TextBaseline.alphabetic,
                    child: Icon(
                      Icons.search,
                      color: AppColors.placeholderColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Text(
                      "静音无线鼠标",
                      style: TextStyle(fontSize: 28.sp),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 10.w,
              height: 70.h,
              child: Icon(
                Icons.photo_camera,
                color: AppColors.placeholderColor,
              ),
            )
          ],
        ),
      ),
    );
  }

// 主体内容
  Widget _buildContext() {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: ColorsUtil.hexColor(0xE6E6E6),
              ),
            ),
          ),
          child: TabBar(
            controller: _tabController,
            labelColor: ColorsUtil.hexColor(0xDB3535),
            indicatorColor: ColorsUtil.hexColor(0xDB3535),
            unselectedLabelColor: ColorsUtil.hexColor(0x222222),
            indicatorWeight: 0,
            indicator: MyUnderlineTabIndicator(
              borderSide: BorderSide(
                width: 2.0,
                color: ColorsUtil.hexColor(0xDB3535),
              ),
              lineWidth: 50.w,
            ),
            indicatorSize: TabBarIndicatorSize.label,
            // 指示器的大小计算方式，以文本方式
            isScrollable: true,
            //labelPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            labelStyle: TextStyle(fontSize: 30.sp),
            tabs: <Widget>[
              Tab(text: '热门'),
              Tab(text: '手机'),
              Tab(text: '电脑'),
              Tab(text: '水果'),
              Tab(text: '食品'),
              Tab(text: '内衣'),
              Tab(text: '医药'),
              Tab(text: '母婴'),
              Tab(text: '百货'),
              Tab(text: '车品'),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              PopularProduct(),
              Text("价差指标"),
              Text("期货数据"),
              Text("价差指标"),
              Text("期货数据"),
              Text("价差指标"),
              Text("期货数据"),
              Text("价差指标"),
              Text("期货数据"),
              Text("价差指标"),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          //color: Colors.red,
          child: Column(
            children: <Widget>[
              _buildSearch(),
              Expanded(
                flex: 1,
                child: _buildContext(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 10, vsync: this);
  }

  @override
  bool get wantKeepAlive => true;
}
