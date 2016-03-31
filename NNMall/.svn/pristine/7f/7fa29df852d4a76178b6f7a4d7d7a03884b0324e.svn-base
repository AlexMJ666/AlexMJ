//
//  NNCommonDeal.h
//  NNMall
//
//  Created by shaoxu on 15/11/3.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NNCommonDeal : NSObject

/**UIAlertView的统一封装
 *\param        target:             委托对象
 *\param        titleOfPrompt:      标题
 *\param        promptMessage:      内容
 *\param        cancelBtnTitle:     取消按钮
 *\param        otherBtnTitleArray: 其它按钮的数组
 *\returns      return:             无
 */
+ (void)promptWithAlert:(id)target
          titleOfPrompt:(NSString *)promptTitle
                    tag:(int)tags
        messageOfPrompt:(NSString *)promptMessage
      cancelButtonTitle:(NSString *)cancelBtnTitle
  otherButtonTitleArray:(NSArray *)otherBtnTitleArray;

/**字典安全保护
 *\param        key:        key值
 *\param        newObjec:   value的内容
 *\param        dic:        字典
 *\returns
 */
+(void)setSafetyObject:(id)newObjec
                forKey:(id)key
                andDic:(NSMutableDictionary *)dic;

/**数组安全保护
 *\param        key:        key值
 *\param        array:      数组
 *\returns
 */
+(id)safetyArrayOjectAtIndex:(int)index
                    andArray:(NSMutableArray *)array;

/**添加数组
 *\param        object:     要添加的对象
 *\param        array:      数组
 *\returns
 */
+(void)safetyAddObject:(id)object
              andArray:(NSMutableArray *)array;

/**数组中插入对象
 *\param        object:     要添加的对象
 *\param        index:      对象添加的位置
 *\param        array:      数组
 *\returns
 */
+(void)safetyInsertObject:(id)object
                  atIndex:(int)index
                 andArray:(NSMutableArray *)array;

/**判断当前的字符串是否为nil，[NULL null],@""
 *\param        str:        传入的字符串
 *\returns      BOOL:       yes表示是上面其中之一，no表示不是
 */
+(BOOL)jugementStringIsNil:(NSString *)str;

/**判断当前的数组是否为nil，[NULL null]
 *\param        arr:        传入的字符串
 *\returns      BOOL:       yes表示是上面其中之一，no表示不是
 */
+(BOOL)jugementArrIsNil:(NSArray *)arr;

/**判断当前的字典是否为nil，[NULL null]
 *\param        arr:        传入的字符串
 *\returns      BOOL:       yes表示是上面其中之一，no表示不是
 */
+(BOOL)jugementDicIsNil:(NSDictionary *)dic;

/**获取当前时间
 *\param        param:      无
 *\returns      return:     MMddHHmmss的时间类型字符串
 */
+ (NSString *)getNowDateTime;

/**获取含删除线的价格
 *\param        oldPrice:   价格
 *\returns      return:     含删除线的价格
 */
+ (NSMutableAttributedString *)getOldPrice:(NSString *)oldPrice
                               andNewPrice:(NSString *)newPrice
                            andOldFontSize:(CGFloat)size
                            andNewFontSize:(CGFloat)newSize;

/**获取字体
 *\param        fontSize:   大小
 *\returns      return:     字体
 */
+(UIFont *)getFont:(CGFloat)fontSize;

/**计算文本高度
 *\param        titleContent:   文字
 *\param        width:          文字宽度
 *\param        size:           字体大小
 *\returns      return:         文本高度
 */
+(CGFloat)getTextHeight:(NSString *)titleContent
               andWidth:(CGFloat)width
            andFontSize:(CGFloat)size;

+(NSString *)getSizeFromCartProduct:(NSDictionary *)sizeDic;

@end
