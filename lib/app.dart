import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:pingduoduo/common/provide/index.dart';
import 'package:pingduoduo/common/routers/application.dart';
import 'package:pingduoduo/common/routers/routes.dart';
import 'package:pingduoduo/config.dart';

import 'common/values/values.dart';
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // 路由
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
    return Store.init(
        context: context,
        child: MaterialApp(
          title: APP_NAME,
          onGenerateRoute: Application.router.generator,
          debugShowCheckedModeBanner: true,
          theme: AppTheme.theme,
          home: Container(),
        ));
  }
}
