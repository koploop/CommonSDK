//
//  NSDecimalNumber+Math.h
//  CommonSDK
//
//  Created by Weelh on 2016/12/1.
//  Copyright © 2016年 Weelh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDecimalNumber (Math)

/*!
 *
 *  @brief 加法
 *  @param number 被加数
 *  @return 结果值
 */
- (NSDecimalNumber *)xAdd:(id)number;

/*!
 *
 *  @brief 减法
 *  @param number 被减数
 *  @return 结果值
 */
- (NSDecimalNumber *)xSubtract:(id)number;

/*!
 *
 *  @brief 乘法
 *  @param number 被乘数
 *  @return 结果值
 */
- (NSDecimalNumber *)xMultiply:(id)number;

/*!
 *
 *  @brief 除法
 *  @param number 被除数
 *  @return 结果值
 */
- (NSDecimalNumber *)xDivide:(id)number;


@end
