#import "FlutterHtmlTextPlugin.h"
#import "FlutterIosTextLabelFactory.h"

@implementation FlutterHtmlTextPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"flutter_html_text_plugin"
                                     binaryMessenger:[registrar messenger]];
    FlutterHtmlTextPlugin* instance = [[FlutterHtmlTextPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
    
    [FlutterIosTextLabelFactory registerWithRegistrar:registrar];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"getPlatformVersion" isEqualToString:call.method]) {
        result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
    } else {
        result(FlutterMethodNotImplemented);
    }
}

@end
