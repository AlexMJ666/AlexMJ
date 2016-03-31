//
//  NNCommonDeal.m
//  NNMall
//
//  Created by shaoxu on 15/11/3.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNCommonDeal.h"

@implementation NNCommonDeal

+ (void)promptWithAlert:(id)target
          titleOfPrompt:(NSString *)promptTitle
                    tag:(int)tags
        messageOfPrompt:(NSString *)promptMessage
      cancelButtonTitle:(NSString *)cancelBtnTitle
  otherButtonTitleArray:(NSArray *)otherBtnTitleArray
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:promptTitle message:promptMessage delegate:target cancelButtonTitle:cancelBtnTitle otherButtonTitles:nil];
    alert.tag = tags;
    for (NSString *str in otherBtnTitleArray)
    {
        [alert addButtonWithTitle:str];
    }
    [alert show];
}

+(void)setSafetyObject:(id)newObjec forKey:(id)key andDic:(NSMutableDictionary *)dic
{
#ifdef DEBUG//调测时候，出现崩溃newobjet为nil时候继续执行
    if(newObjec == nil)
    {
        NSLog(@"出现字典中设置nil");
    }
    [dic setObject:newObjec forKey:key];
#else
    if(newObjec == nil)
    {
        
    }else{
        [dic setObject:newObjec forKey:key];
    }
#endif
}

+(id)safetyArrayOjectAtIndex:(int)index andArray:(NSMutableArray *)array
{
    NSUInteger count = [array count];
#ifdef DEBUG
    if(count ==0 || array == nil ||index>=count)
    {
        NSLog(@"数组越界，或者数组为nil");
    }
    return [array objectAtIndex:index];
#else
    if(count ==0 || array == nil ||index>=count)
    {
        return  nil;
    }else{
        return [array objectAtIndex:index];
    }
#endif
}

+(void)safetyAddObject:(id)object andArray:(NSMutableArray *)array
{
#ifdef DEBUG
    if(object == nil)
    {
        NSLog(@"添加到数组中的对象为nil");
    }
    [array addObject:object];
#else
    if(object != nil)
    {
        [array addObject:object];
    }
#endif
}

+(void)safetyInsertObject:(id)object atIndex:(int)index andArray:(NSMutableArray *)array
{
#ifdef DEBUG
    if(object == nil)
    {
        NSLog(@"添加到数组中的对象为nil");
    }
    [array insertObject:object atIndex:index];
#else
    if(object != nil)
    {
        [array insertObject:object atIndex:index];
    }
#endif
}

+(BOOL)jugementStringIsNil:(NSString *)str
{
    
    if(str == nil || [str isKindOfClass:[[NSNull null] class]] || str == NULL)
    {
        return YES;
    }else
    {
        return NO;
    }
}

+(BOOL)jugementArrIsNil:(NSArray *)arr
{
    if(arr == nil || [arr isKindOfClass:[[NSNull null] class]] || arr == NULL)
    {
        return YES;
    }else
    {
        return NO;
    }
}

+(BOOL)jugementDicIsNil:(NSDictionary *)dic
{
    if(dic == nil || [dic isKindOfClass:[[NSNull null] class]])
    {
        return YES;
    }else
    {
        return NO;
    }
}

//获取当前时间
+ (NSString *)getNowDateTime
{
    NSDate *nowDate = [NSDate date];
    NSDateFormatter *dateformat = [[NSDateFormatter alloc] init];
    [dateformat setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString *str = [dateformat stringFromDate:nowDate];
    return str;
}

+ (NSMutableAttributedString *)getOldPrice:(NSString *)oldPrice
                               andNewPrice:(NSString *)newPrice
                            andOldFontSize:(CGFloat)size
                            andNewFontSize:(CGFloat)newSize
{
    NSUInteger length = [newPrice length]+3;
    NSString *str = [NSString stringWithFormat:@"¥%@  ¥%@",newPrice,oldPrice];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc]initWithString:str];
    [attr addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlineStyleSingle|NSUnderlinePatternSolid) range:NSMakeRange(length, str.length-length)];
    [attr addAttribute:NSStrikethroughColorAttributeName value:[UIColor grayColor] range:NSMakeRange(length, str.length-length)];
    [attr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:size] range:NSMakeRange(length, str.length-length)];
    [attr addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(length, str.length-length)];
    [attr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:newSize] range:NSMakeRange(0, length-1)];

    return attr;
}

+(UIFont *)getFont:(CGFloat)fontSize
{
    if (IsIOS9) {
        return [UIFont fontWithName:@"PingFangSC-Regular" size:fontSize];
    }
    return [UIFont fontWithName:@"STHeitiSC-Light" size:fontSize];
}

+(CGFloat)getTextHeight:(NSString *)titleContent
               andWidth:(CGFloat)width
            andFontSize:(CGFloat)size
{
    CGSize titleSize = [titleContent boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:size]} context:nil].size;
    return titleSize.height;
}

+(NSString *)getSizeFromCartProduct:(NSDictionary *)sizeDic
{
    if (!sizeDic) {
        return @"";
    }
    
    NSMutableArray *sizeArr = [[NSMutableArray alloc]init];
    NSString *color = [sizeDic objectForKey:@"specColor"];
    NSString *size = [sizeDic objectForKey:@"specSize"];
    if (![self jugementStringIsNil:color]) {
        [sizeArr addObject:[NSString stringWithFormat:@"颜色：%@",color]];
    }
    if (![self jugementStringIsNil:size]){
        [sizeArr addObject:[NSString stringWithFormat:@"尺码：%@",size]];
    }
    if (sizeArr.count == 0) {
        return @"";
    }
    return [sizeArr componentsJoinedByString:@" "];
}

@end