import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/17.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
///代码清单
class HTMLTextWidet extends StatefulWidget {
  final String htmlText;

  HTMLTextWidet({@required this.htmlText, Key key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<HTMLTextWidet> {
  @override
  Widget build(BuildContext context) {
    return Material(
      ///填充布局
      child: Stack(children: [
        Container(

          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: buildNaviteWidget(),
        ),
        isFinish
            ? Container()
            : Container(
                width: double.infinity,
                color: Colors.white,
                height: double.infinity,
              )
      ]),
    );
  }

  ///不要问为什么
  buildNaviteWidget() {
    if (widget.htmlText == null || widget.htmlText.length == 0) {
      return Container();
    }
    return Platform.isAndroid ? buildAndroidView() : buildUIKitView();
  }

  bool isFinish = false;

  //代码清单9-2-44
  buildAndroidView() {
    return AndroidView(
      //设置标识
      viewType: "com.studyon./text_html",
      //参数
      creationParams: {
        "htmlText": widget.htmlText,
      },
      onPlatformViewCreated: (int id) {
        //Android 原生的 View 创建后的回调
        setState(() {
          isFinish = true;
        });
      },
      //参数的编码方式
      creationParamsCodec: const StandardMessageCodec(),
    );
  }

  ///代码清单9-1-50
  /// 通过 UiKitView 来加载 iOS原生View
  buildUIKitView() {
    return UiKitView(
      //标识
      viewType: "com.studyon./text_html",
      creationParams: {
        "htmlText": widget.htmlText,
      },
      //参数的编码方式
      creationParamsCodec: const StandardMessageCodec(),
    );
  }
}
