package com.studyyoun.html.flutter_html_text_plugin;

/*
 * 创建人： Created by  on 2020/9/16.
 * 创建时间：Created by  on 2020/9/16.
 * 页面说明：
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

import android.content.Context;
import android.text.Html;
import android.text.method.LinkMovementMethod;
import android.view.View;
import android.widget.TextView;

import java.util.Map;

import io.flutter.plugin.platform.PlatformView;

///代码清单9-1-41
/// 创建 Android 原生自定义View
public class TestTextView implements PlatformView {
	
	///这里使用的是一个 TextView
	private final TextView mTestTextView;
	/**
	 *
	 * @param context
	 * @param id
	 * @param params  初始化时 flutter 传递过来的参数
	 */
	TestTextView(Context context, int id, Map<String, Object> params) {
		//创建 TextView
		TextView lTextView = new TextView(context);
		//设置文字
		lTextView.setText("Android的原生TextView aas ");
		this.mTestTextView = lTextView;
		
		//flutter 传递过来的参数
		if (params!=null&&params.containsKey("htmlText")) {
			String myContent = (String) params.get("htmlText");
			lTextView.setText(Html.fromHtml(myContent, null, new MxgsaTagHandler(context)));
			lTextView.setClickable(true);
			lTextView.setMovementMethod(LinkMovementMethod.getInstance());
		}
		
	}
	
	@Override
	public View getView() {
		return mTestTextView;
	}
	
	@Override
	public void dispose() {}
}
