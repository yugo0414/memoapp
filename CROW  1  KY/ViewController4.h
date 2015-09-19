//
//  ViewController4.h
//  CROW  1  KY
//
//  Created by fukurou on 2014/11/19.
//  Copyright (c) 2014年 YugoFukunaga. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ViewController4Delegate;

@interface ViewController4 : UIViewController{
    IBOutlet UITextView *textView;
    NSMutableArray *memos;
    NSMutableArray *xArray;
    NSMutableArray *yArray;
    NSMutableArray *cArray;
    NSUserDefaults *saveData;
    
    
    
}
-(IBAction)tapReturn;

@property (weak, nonatomic) id<ViewController4Delegate> delegate;

// イニシャライザ
- (id)init;

//「おくる」側で値をセットするための関数
-(void)set;

@end//これももともとある

@protocol ViewController4Delegate <NSObject>

// 「もらう」で呼び出すためのメソッド「おくる」、ここでは送る値はNSString
- (void)send:(NSString*)str;


@end
