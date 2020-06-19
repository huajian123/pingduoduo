part of 'routes.dart';

/*-------登录------*/
Handler loginHander = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return Text("首页");
    });


/*-------启动广告页------*/
Handler startAdvHander = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return Text("启动页");
    });


/*-------首页------*/
Handler homeHander = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return Layout();
    });
