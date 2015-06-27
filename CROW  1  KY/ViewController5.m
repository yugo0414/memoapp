//
//  ViewController5.m
//  CROW  1  KY
//
//  Created by fukurou on 2015/01/27.
//  Copyright (c) 2015年 YugoFukunaga. All rights reserved.
//

#import "ViewController5.h"
#import "ViewController4.h"
@interface ViewController5 ()

@end


@implementation ViewController5


- (void)viewDidLoad {
    
    
    UIView *uv = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1000, 1000)];
    [sv addSubview:uv];
    sv.contentSize = uv.bounds.size;
    [self.view addSubview:sv];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapScrollView:)];
    sv.userInteractionEnabled = YES;
    [sv addGestureRecognizer:tapGesture];

    colorNumber=1;
    // ビューにジェスチャーを追加
    aView.frame = CGRectMake(-aView.frame.size.width, 0, aView.frame.size.width, self.view.frame.size.height);


}

    /**
     * ビューがタップされたとき
     */

-(void)tapScrollView:(id)sender{
    CGPoint tapPoint = [sender locationInView:sv];
    //box.frame=CGRectMake(tapPoint.x, tapPoint.y, 70, 70);
    boxTextField[count] =[[UITextView alloc]init];
    boxTextField[count].frame=CGRectMake(tapPoint.x, tapPoint.y, 120, 50);
    NSLog(@"%@",@"OK");
    
    [sv addSubview:boxTextField[count]];
    
    if(colorNumber==1){
        boxTextField[count].backgroundColor = [UIColor orangeColor];
    }else if (colorNumber==2){
         boxTextField[count].backgroundColor = [UIColor greenColor];
    }else if (colorNumber==3){
        boxTextField[count].backgroundColor = [UIColor purpleColor];
    }else if (colorNumber==4){
        boxTextField[count].backgroundColor = [UIColor redColor];
    }else if (colorNumber==5){
        boxTextField[count].backgroundColor = [UIColor blueColor];

    }
    
       ViewController4 *vc4 = [self.storyboard instantiateViewControllerWithIdentifier:@"vc4"];
    vc4.delegate = self;
    [self presentViewController:vc4 animated:YES completion:nil];

    count=count+1;

    

}

/*
 
- (void)tapScrollView;(id)sender{
    CGPoint tapPoint = [sender locationInView:sv];
        //    box.frame=CGRectMake(location.x, location.y, 70, 70);
    UIView *box2=[[UIView alloc]init];
    box2.backgroundColor=[UIColor blackColor];
    box2.frame=CGRectMake(tapPoint.x, tapPoint.y, 120, 50);
    NSLog(@"%@",@"OK");
    [sv addSubview:box2];
    box2.backgroundColor = [UIColor orangeColor];
        



    
}
 */
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    box.backgroundColor = [UIColor orangeColor];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    //タッチしたときの座標を保存する
    x = location.x;
    y = location.y;
    
    
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
        UITouch*touch = [touches anyObject];
        CGPoint location = [touch locationInView:self.view];
    //    box.frame=CGRectMake(location.x, location.y, 70, 70);
    if (location.x -x >20 ){ //もし指を右に20px以上動かしたら
        
        //スライドしていくアニメーションをつけてviewを表示する
        [UIView animateWithDuration:0.3 animations:^{
            aView.frame = CGRectMake(0, 0, aView.frame.size.width, self.view.frame.size.height);
            
        }];
    }
    
    if (x -location.x >20 ) { //もし指を左に20px以上動かしたら
        [UIView animateWithDuration:0.3 animations:^{
            
            //スライドしていくアニメーションをつけてviewを隠す
            aView.frame = CGRectMake(-aView.frame.size.width, 0, aView.frame.size.width, self.view.frame.size.height);
            
        }];
    }


    }


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(IBAction)date{
NSString *directory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
NSString *filePath = [directory stringByAppendingPathComponent:@"data.dat"];

NSArray *array = @[@"山田太郎", @"東京都中央区"];
BOOL successful = [NSKeyedArchiver archiveRootObject:array toFile:filePath];
if (successful) {
    NSLog(@"%@", @"データの保存に成功しました。");
}
}

-(IBAction)mode1{
    
    }

-(IBAction)mode2{
    
    
}

- (void)send:(NSString*)str
{
    //受け取った値をlogに表示
    NSLog(@"%@", str);
    boxTextField[0].text =str;
    //「つくる」を閉じる
    [self dismissViewControllerAnimated:YES completion:NULL];
}

//Storyboardをつかわない編
-(IBAction)colorgreen{
    colorNumber=2;
}
-(IBAction)colorpupre{
    colorNumber=3;
}
-(IBAction)colorred{
    colorNumber=4;
    
}
-(IBAction)colorblue{
    colorNumber=5;
}

@end


