//
//  CommonMathPreciousFunction.h
//  CommonSDK
//
//  Created by Weelh on 2016/12/1.
//  Copyright © 2016年 Weelh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonMathPreciousFunction : NSObject

/*!
 *
 *  @brief 把对象类型转化成NSDecimalNumber类型
 *  @param number 需转换的对象类型（NSString、NSNumber、NSDecimalNumber）
 *  @return 转化后的NSDecimalNumber对象
 */
NSDecimalNumber * XMathCreateDecimalByNumber(id number);

/*!
 *
 *  @brief 保留指定精度，返回NSDecimalNumber (小数点末尾0不显示)
 *  @param scale  0：保留原值， 大于0：保留指定精度
 *  @param number 需计算精度的对象（NSString、NSNumber、NSDecimalNumber）
 *  @return 结果
 */
NSDecimalNumber * XMathRounding(NSInteger scale, id number);

/*!
 *
 *  @brief 保留指定精度，返回NSString (小数点末尾的0也显示)
 *  @param scale  scale  0：保留原值， 大于0：保留指定精度
 *  @param number 需计算精度的对象（NSString、NSNumber、NSDecimalNumber）
 *  @return 结果
 */
NSString * XMathRoundingToString(NSInteger scale ,id number);

/*!
 *
 *  @brief 加法
 *  @param numberA 加数（对象类型）（NSString、NSNumber、NSDecimalNumber）
 *  @param numberB 被加数（对象类型）（NSString、NSNumber、NSDecimalNumber）
 *  @param ... 更多加数
 *  @return 运算结果
 */
NSDecimalNumber * XMathAdd(id numberA, id numberB, ...)__attribute__((sentinel));

/*!
 *
 *  @brief 减法
 *  @param numberA 减数（对象类型）（NSString、NSNumber、NSDecimalNumber）
 *  @param numberB 被减数（对象类型）（NSString、NSNumber、NSDecimalNumber）
 *  @return 运算结果
 */
NSDecimalNumber * XMathSubtract(id numberA, id numberB);

/*!
 *
 *  @brief 乘法
 *  @param scale   0：保留原值， 大于0：保留指定精度
 *  @param numberA 乘数（对象类型）（NSString、NSNumber、NSDecimalNumber）
 *  @param numberB 被乘数（对象类型）（NSString、NSNumber、NSDecimalNumber）
 *  @param ...     更多被乘数（对象类型）（NSString、NSNumber、NSDecimalNumber）
 *  @return 运算结果
 */
NSDecimalNumber * XMathMultiply(NSInteger scale, id numberA , id numberB, ...)__attribute__((sentinel));

/*!
 *
 *  @brief 除法
 *  @param scale   0：保留原值， 大于0：保留指定精度
 *  @param numberA 除数（对象类型）（NSString、NSNumber、NSDecimalNumber）
 *  @param numberB 被除数（对象类型）（NSString、NSNumber、NSDecimalNumber）
 *  @return 运算结果
 */
NSDecimalNumber * XMathDivide(NSInteger scale, id numberA, id numberB);

@end
