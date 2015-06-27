//
//  ViewController5.h
//  CROW  1  KY
//
//  Created by ; on 2015/01/27.
//  Copyright (c) 2015年 . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController4.h"

@interface ViewController5 : UIViewController<ViewController4Delegate>{
   
   
    IBOutlet UIView * box;
    IBOutlet UIScrollView *sv;
    IBOutlet UIView*menuView;
    int colorNumber;
    BOOL isMenuShow;
    IBOutlet UIView *aView;
    int count;
    //タップした時の座標を保存する
    CGFloat x;
    CGFloat y;

    
    UITextView *boxTextField[50];
}
-(IBAction)mode1;
-(IBAction)mode2;
-(IBAction)colorgreen;
-(IBAction)colorblue;
-(IBAction)colorred;
-(IBAction)colorpupre;





@end
