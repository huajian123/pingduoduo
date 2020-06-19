import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pingduoduo/config.dart';
import 'package:pingduoduo/global.dart';


import 'utils.dart';


/// 检查是否有 token
Future<bool> isAuthenticated() async {
  var profileJSON = StorageUtil().getJSON(STORAGE_USER_PROFILE_KEY);
  return profileJSON != null ? true : false;
}

/// 删除缓存 token
Future deleteAuthentication() async {
  await StorageUtil().remove(STORAGE_USER_PROFILE_KEY);
  Global.profile = null;
}

/// 重新登录
Future goLoginPage(BuildContext context) async {
  await deleteAuthentication();
  // todo
 // 这里应该路由跳转 。。。
}
