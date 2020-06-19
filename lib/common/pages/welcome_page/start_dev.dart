import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingduoduo/common/routers/application.dart';
import 'package:pingduoduo/common/utils/utils.dart';

class StartDev extends StatefulWidget {
  @override
  _StartDevState createState() => _StartDevState();
}

class _StartDevState extends State<StartDev> {
  Timer _timer;
  int _count = 3; //倒计时秒数

  void _initTimer(context) {
    // 倒计时
    _timer = Timer.periodic(new Duration(seconds: 1), (timer) {
      setState(() {
        if (_count <= 1) {
          _timer.cancel();
          _timer = null;
          _goMain(context);
        } else {
          _count = _count - 1;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initTimer(this.context);
  }

  _goMain(context) {
    Application.router.navigateTo(context, "/home",
        transition: TransitionType.cupertino, clearStack: true);
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image(
              image: AssetImage("assets/images/start_bg.png"),
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: 70.h,
            right: 70.w,
            child: GestureDetector(
              onTap: () {
                _goMain(context);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: ColorsUtil.hexColor(0x2f3542, alpha: 0.2),
                    borderRadius: new BorderRadius.circular(20.0)),
                width: 160.w,
                height: 60.h,
                child: Center(
                  child: Text(
                    "跳过广告 " + _count.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
