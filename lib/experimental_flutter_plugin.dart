
import 'dart:async';

import 'package:experimental_flutter_plugin/services/postsService.dart';
import 'package:flutter/services.dart';
import 'package:flutter_config/flutter_config.dart';

import 'models/post.dart';

class ExperimentalFlutterPlugin {
  static const MethodChannel _channel =
      const MethodChannel('experimental_flutter_plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> get init async {
    FlutterConfig.get('FABRIC_ID'); // returns 'abcdefgh'

    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<List<Post>> getPosts(int limit, int offset) async {
    // final String  API_HOST = FlutterConfig.get('API_HOST'); // returns 'abcdefgh'

    return fetchPosts(limit, offset);
  }

}
