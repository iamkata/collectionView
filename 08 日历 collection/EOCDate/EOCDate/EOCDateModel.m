//
//  EOCDateModel.m
//  EOCDate
//
//  Created by sy on 2017/9/29.
//  Copyright © 2017年 SunYong. All rights reserved.
//

#import "EOCDateModel.h"

@implementation EOCDateModel

// @"2016-09-29" YYYY-MM-dd
/*
 字符串格式，转时间 时间差
*/
//返回某个月多少天
+ (NSInteger)totalDaysInMonthFromStr:(NSString*)dateStr{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init]; //默认是GMT
    //通过GMT时区创建一个本地时区,偏移0
    [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    NSDate *date = [formatter dateFromString:dateStr];
    return  [self totalDaysInMonthFromDate:date];
}

//返回某个月多少天
+ (NSInteger)totalDaysInMonthFromDate:(NSDate*)date{
    NSRange dayRange = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return dayRange.length;
}

//返回某个月的第一天是星期几
+ (NSInteger)weekDayMonthOfFirstDayFromStr:(NSString*)dateStr{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init]; //GMT
    [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    NSDate *date = [formatter dateFromString:dateStr];
    return  [self weekDayMonthOfFirstDayFromDate:date];
}

//返回某个月的第一天是星期几
+ (NSInteger)weekDayMonthOfFirstDayFromDate:(NSDate*)date{
    // 1 sun  2 Mon 3 thes
    NSInteger firstDayOfMonthInt = [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitWeekOfMonth forDate:date];
    return firstDayOfMonthInt-1;
}

@end
