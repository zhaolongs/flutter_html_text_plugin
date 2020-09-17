//
//  FlutterIosTextLabel.m
//  Runner
//
//  Created by  androidlongs on 2020/9/16.
//

//代码清单9-2-46
#import "FlutterIosTextLabel.h"

@implementation FlutterIosTextLabel{
    //FlutterIosTextLabel 创建后的标识
    int64_t _viewId;
    UILabel * _uiLabel;
    //消息回调
    FlutterMethodChannel* _channel;
}

//在这里只是创建了一个UILabel
-(instancetype)initWithWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args binaryMessenger:(NSObject<FlutterBinaryMessenger> *)messenger{
    if ([super init]) {
        if (frame.size.width==0) {
            frame=CGRectMake(frame.origin.x, frame.origin.y, [UIScreen mainScreen].bounds.size.width, 22);
        }
        _uiLabel =[[UILabel alloc] initWithFrame:frame];
//        _uiLabel.textColor=[UIColor redColor];
//        _uiLabel.text=@"ios 原生 uilabel ";
        _uiLabel.font=[UIFont systemFontOfSize:14];
        _uiLabel.textAlignment=NSTextAlignmentCenter;
//        _uiLabel.backgroundColor=[UIColor grayColor];
        
        //返回的HTML文本 <font color = 'red'></font>
        NSString *str = args[@"htmlText"];
        NSString *HTMLString = [NSString stringWithFormat:@"<html><body>%@</body></html>", str ];
        

        NSDictionary *options = @{NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType,
                                  NSCharacterEncodingDocumentAttribute : @(NSUTF8StringEncoding)
                                  };
        NSData *data = [HTMLString dataUsingEncoding:NSUTF8StringEncoding];
        
        NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithData:data options:options documentAttributes:nil error:nil];
        
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];   // 调整行间距
        paragraphStyle.lineSpacing = 8.0;
        paragraphStyle.alignment = NSTextAlignmentJustified;
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, attributedString.length)];
        
        [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, attributedString.length)];
        
      
        _uiLabel.backgroundColor = [UIColor cyanColor];
        _uiLabel.numberOfLines = 0;
        _uiLabel.attributedText = attributedString;
        [_uiLabel sizeToFit];
      

        
        _viewId = viewId;
    
    }
    return self;
    
}



- (nonnull UIView *)view {
    return _uiLabel;
}

@end
