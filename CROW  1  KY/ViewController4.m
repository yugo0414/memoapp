//
//  ViewController4.m
//  CROW  1  KY
//
//  Created by fukurou on 2014/11/19.
//  Copyright (c) 2014年 YugoFukunaga. All rights reserved.
//

#import "ViewController4.h"
#import "ViewController5.h"


@interface ViewController4 ()

@end

@implementation ViewController4

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(IBAction)tapReturn;{
    [self.delegate send:textView.text];
    [self dismissViewControllerAnimated:YES completion:nil];
     
}
- (id)init
{
    if (self = [super init]) {
        // 初期処理
    }
    return self;
}

- (void)set {
    //[self.delegate send:str];
    
}
@end
