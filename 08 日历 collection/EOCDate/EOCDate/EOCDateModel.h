//
//  EOCDateModel.h
//  EOCDate
//
//  Created by sy on 2017/9/29.
//  Copyright © 2017年 SunYong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EOCDateModel : NSObject

//返回,某个月多少天
+ (NSInteger)totalDaysInMonthFromStr:(NSString*)dateStr;
+ (NSInteger)totalDaysInMonthFromDate:(NSDate*)date;

//返回,某个月的第一天是星期几
+ (NSInteger)weekDayMonthOfFirstDayFromStr:(NSString*)dateStr;
+ (NSInteger)weekDayMonthOfFirstDayFromDate:(NSDate*)date;

@end
