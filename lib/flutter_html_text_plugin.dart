import 'dart:async';

import 'package:flutter/services.dart';

export 'package:flutter_html_text_plugin/src/html_text_widget.dart';

class FlutterHtmlTextPlugin {
  static const MethodChannel _channel =
      const MethodChannel('flutter_html_text_plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
