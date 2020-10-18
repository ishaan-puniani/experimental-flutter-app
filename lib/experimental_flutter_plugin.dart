
import 'dart:async';

import 'package:experimental_flutter_plugin/services/authService.dart';
import 'package:experimental_flutter_plugin/services/postsService.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'models/auth.dart';
import 'models/config.dart';
import 'models/post.dart';

class ExperimentalFlutterPlugin {
  static const MethodChannel _channel =
      const MethodChannel('experimental_flutter_plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> init(Config config) async {
    final Auth auth = await authenticate(config);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', auth.token);
    return auth.token;
  }

  static Future<List<Post>> getPosts(int limit, int offset) async {

    return fetchPosts(limit, offset);
  }

}
