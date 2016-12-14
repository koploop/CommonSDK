//
//  CommonPreciseHelper.h
//  CommonSDK
//
//  Created by Weelh on 2016/12/1.
//  Copyright © 2016年 Weelh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonPreciseHelper : NSObject

/*!
 *
 *  @brief 判断字符串是否是int类型
 *  @param string 需判断的字符串
 *  @return yes/no
 */
+ (BOOL)isPureInt:(NSString *)string;

/*!
 *
 *  @brief 判断字符串是否是float类型
 *  @param string 需判断的字符串
 *  @return yes/no
 */
+ (BOOL)isPureFloat:(NSString *)string;

/*!
 *
 *  @brief 判断字符串是否是数字
 *  @param string 需判断的字符串
 *  @return yes/no
 */
+ (BOOL)isPureNumber:(NSString *)string;

/*!
 *
 *  @brief 把对象转化成NSDecimalNumber类型
 *  @param number 供转化的对象（NSString、NSNumber、NSDecimalNumber）
 *  @return 返回NSDecimalNumber对象
 */
+ (NSDecimalNumber *)convertToDecimalNumber:(id)number;

/*!
 *
 *  @brief 创建需保存的精度Handler
 *  @param scale 需保存的精度
 *  @return Handler
 */
+ (NSDecimalNumberHandler *)createSimpleRoundPlainByScale:(NSInteger)scale;

/*!
 *
 *  @brief 把传入数组的所有数值相乘
 *  @param idParameterArray 传入的数据数组
 *  @return 相乘的结果
 */
+ (NSDecimalNumber *)multiplyByIdParameter:(NSArray *)idParameterArray;


@end
