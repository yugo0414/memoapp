//
//  ViewController5.h
//  CROW  1  KY
//
//  Created by ; on 2015/01/27.
//  Copyright (c) 2015年 . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController4.h"

@interface ViewController5 : UIViewController {
   
   
  //  IBOutlet UIView * box;
    IBOutlet UIScrollView *scrollView;
    IBOutlet UIView*menuView;
    int colorNumber;
    BOOL isMenuShow;
    BOOL isEdit;
    IBOutlet UIView *aView;
    int count;
    //タップした時の座標を保存する
    CGFloat x;
    CGFloat y;
    CGFloat c;
    NSString *t;
    NSMutableArray *xArray;
    NSMutableArray *yArray;
    NSMutableArray *cArray;
    NSUserDefaults*saveData;
     NSMutableArray *memos;
    NSData *data;

    
    UITextView *boxTextLabelArray[50];
}

-(IBAction)colorgreen;
-(IBAction)colororange;
-(IBAction)colorred;
-(IBAction)colorpupre;

-(IBAction)deleteButton;

-(IBAction)save;





@end
