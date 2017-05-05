//
//  ViewController.m
//  HeadLineView
//
//  Created by ym on 17/5/5.
//  Copyright © 2017年 王宁. All rights reserved.
//
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

#define kMidViewWidth   250
#define kMidViewHeight  50

#import "ViewController.h"
#import "WNSHeadLineModel.h"
#import "WNSHeadLineView.h"
@interface ViewController ()
@property(nonatomic,strong)NSMutableArray*dataArr;
@property (nonatomic,strong) WNSHeadLineView *TopLineView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _dataArr=[[NSMutableArray alloc]init];
    self.view.backgroundColor =[UIColor lightGrayColor];
    [self createTopLineView];
    [self getData];
}
#pragma mark-创建头条视图
-(void)createTopLineView{
    
    _TopLineView = [[WNSHeadLineView alloc]initWithFrame:CGRectMake(0, 0, kMidViewWidth, 20)];
    _TopLineView.center = CGPointMake(ScreenWidth/2.0, ScreenHeight/2.0-150);
    _TopLineView.backgroundColor = [UIColor whiteColor];
    __weak __typeof(self)weakSelf = self;
    _TopLineView.clickBlock = ^(NSInteger index){
        WNSHeadLineModel *model = weakSelf.dataArr[index];
        NSLog(@"%@,%@",model.type,model.title);
    };
    [self.view addSubview:_TopLineView];
    
    
}
#pragma mark-获取数据
- (void)getData
{
    //    NSArray *arr1 = @[@"推荐",@"最热",@"最新",@"关注",@"反馈"];
    NSArray *arr2 = @[@"大降价了啊",@"iPhone7分期",@"这个苹果蛮脆的",@"来尝个香蕉吧",@"越来越香了啊你的秀发"];
    for (int i=0; i<arr2.count; i++) {
        WNSHeadLineModel *model = [[WNSHeadLineModel alloc]init];
        //        model.type = arr1[i];
        model.title = arr2[i];
        [_dataArr addObject:model];
    }
    [_TopLineView setVerticalShowDataArr:_dataArr];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
