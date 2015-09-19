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
    
    saveData= [NSUserDefaults standardUserDefaults];
    
    /*配列の初期化・再設定*/

    UIView *uv = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1000, 1000)];
    [scrollView addSubview:uv];
    scrollView.contentSize = uv.bounds.size;
    [self.view addSubview:scrollView];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapScrollView:)];
    scrollView.userInteractionEnabled = YES;
    [scrollView addGestureRecognizer:tapGesture];
    
    colorNumber=1;
    // ビューにジェスチャーを追加
    aView.frame = CGRectMake(-aView.frame.size.width, 0, aView.frame.size.width, self.view.frame.size.height);
    
}

-(void)viewWillAppear:(BOOL)animated {
    
    if ([saveData arrayForKey:@"KEYxArray"] == nil ) {
        xArray = [[NSMutableArray alloc] init];
        
    }else{
        xArray = [[saveData arrayForKey:@"KEYxArray"] mutableCopy];
    }
    
    if ([saveData arrayForKey:@"KEYyArray"] == nil ) {
        yArray = [[NSMutableArray alloc] init];
        
    }else{
        yArray = [[saveData arrayForKey:@"KEYyArray"] mutableCopy];
    }
    if ([saveData arrayForKey:@"KEYcArray"] == nil ) {
        cArray = [[NSMutableArray alloc] init];
        
    }else{
        cArray = [[saveData arrayForKey:@"KEYcArray"] mutableCopy];
    }
    
    
    if ([saveData arrayForKey:@"memoskey"] == nil ) {
        memos = [[NSMutableArray alloc] init];
        
    }else{
        memos = [[saveData arrayForKey:@"memoskey"] mutableCopy];
    }
    /*ここまで*/
    /*配列をもとにviewを表示*/
    //配列分だけfor文をまわす
    //memos[i],xArray[i]などを使ってviewを生成、表示
    for (int i = 0 ; i < memos.count ; i++) {
        boxTextLabelArray[i] =[[UITextView alloc]init];
        NSString * xStr = [xArray objectAtIndex:i];
        NSString * yStr = [yArray objectAtIndex:i];
        NSString * cStr = [cArray objectAtIndex:i];
        NSString * text = [memos objectAtIndex:i];
        boxTextLabelArray[i].frame = CGRectMake(xStr.floatValue, yStr.floatValue, 120, 50);
        boxTextLabelArray[i].text = text;
        
        c = cStr.intValue;
        
        if(c==1){
            boxTextLabelArray[i].backgroundColor = [UIColor orangeColor];
        }else if (c==2){
            boxTextLabelArray[i].backgroundColor = [UIColor greenColor];
        }else if (c==3){
            boxTextLabelArray[i].backgroundColor = [UIColor purpleColor];
        }else if (c==4){
            boxTextLabelArray[i].backgroundColor = [UIColor redColor];
        }else if (c==5){
            boxTextLabelArray[i].backgroundColor = [UIColor blueColor];
            
        }
        
        [scrollView addSubview:boxTextLabelArray[i]];
        
    }
}


/**
 * ビューがタップされたとき
 */

-(void)tapScrollView:(id)sender{
    CGPoint tapPoint = [sender locationInView:scrollView];
    boxTextLabelArray[memos.count] =[[UITextView alloc]init];
    boxTextLabelArray[memos.count].frame=CGRectMake(tapPoint.x, tapPoint.y, 120, 50);
    NSLog(@"%@",@"OK");
    
    [scrollView addSubview:boxTextLabelArray[memos.count+1]];
    
    if(colorNumber==1){
        boxTextLabelArray[memos.count].backgroundColor = [UIColor orangeColor];
    }else if (colorNumber==2){
        boxTextLabelArray[memos.count].backgroundColor = [UIColor greenColor];
    }else if (colorNumber==3){
        boxTextLabelArray[memos.count].backgroundColor = [UIColor purpleColor];
    }else if (colorNumber==4){
        boxTextLabelArray[memos.count].backgroundColor = [UIColor redColor];
    }
    ViewController4 *vc4 = [self.storyboard instantiateViewControllerWithIdentifier:@"vc4"];
    vc4.delegate = self;
    [self presentViewController:vc4 animated:YES completion:nil];
    
    [xArray addObject: [NSString stringWithFormat:@"%f",tapPoint.x]];
    [yArray addObject:[NSString stringWithFormat:@"%f",tapPoint.y]];
    [cArray addObject:[NSString stringWithFormat:@"%d",colorNumber]];
    
    [saveData setObject:xArray forKey:@"KEYxArray"];
    [saveData setObject:yArray forKey:@"KEYyArray"];
    [saveData setObject:cArray forKey:@"KEYcArray"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    //boxView.backgroundColor = [UIColor orangeColor];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    x = location.x;
    y = location.y;
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch*touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    //    box.frame=CGRectMake(location.x, location.y, 70, 70);
    if(isEdit==YES){
        boxTextLabelArray[0].center=CGPointMake(location.x, location.y);
        
        
        
    }else{
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
    
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


- (void)send:(NSString*)str
{
    //受け取った値をlogに表示
    NSLog(@"%@", str);
    boxTextLabelArray[0].text =str;
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
-(IBAction)colororange{
    colorNumber=1;
}

-(IBAction)save{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(IBAction)deleteButton{
    
    boxTextLabelArray[memos.count-1].removeFromSuperview;
    [memos removeLastObject];
    [xArray removeLastObject];
    [yArray removeLastObject];
    [cArray removeLastObject];
    
    [saveData setObject:xArray forKey:@"KEYxArray"];
    [saveData setObject:yArray forKey:@"KEYyArray"];
    [saveData setObject:cArray forKey:@"KEYcArray"];
    
    [saveData setObject:memos forKey:@"memoskey"];

}
@end


