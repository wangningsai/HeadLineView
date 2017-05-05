//
//  WNSHeadLineView.h
//  HeadLineView
//
//  Created by ym on 17/5/5.
//  Copyright © 2017年 王宁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WNSHeadLineModel.h"
@interface WNSHeadLineView : UIView
@property (nonatomic,copy) void (^clickBlock)(NSInteger index);//第几个数据被点击

//数组内部数据需要是GBTopLineViewModel类型
- (void)setVerticalShowDataArr:(NSMutableArray *)dataArr;

//停止定时器(界面消失前必须要停止定时器否则内存泄漏)
- (void)stopTimer;

@end
