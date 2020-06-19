import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:pingduoduo/common/pages/pages.dart';
part 'handler.dart';

class Routes {
  static String root = "/";

  /*-----登录--------*/
  static String startAdvPage = "/startAdvpage";
  static String loginPage = "/login";
  static String homepage = "/home";

  // 路由配置
  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("找不到路由");
    });

    /*-----启动页--------*/
    router.define(loginPage, handler: loginHander);
    router.define(startAdvPage, handler: startAdvHander);

    /*-----首页--------*/
    router.define(homepage, handler: homeHander);
  }
}
