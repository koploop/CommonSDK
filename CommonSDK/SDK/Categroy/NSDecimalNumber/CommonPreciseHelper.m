//
//  CommonPreciseHelper.m
//  CommonSDK
//
//  Created by Weelh on 2016/12/1.
//  Copyright © 2016年 Weelh. All rights reserved.
//

#import "CommonPreciseHelper.h"

@implementation CommonPreciseHelper

#pragma mark - 判断字符串是否是int类型
+ (BOOL)isPureInt:(NSString *)string {
    NSScanner *scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

#pragma mark - 判断字符串是否是float类型
+ (BOOL)isPureFloat:(NSString *)string {
    NSScanner *scan = [NSScanner scannerWithString:string];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}

#pragma mark - 判断字符串是否是数字
+ (BOOL)isPureNumber:(NSString *)string {
    if (!string || ![string isKindOfClass:[NSString class]] || [string isEqualToString:@"."]) {
        return NO;
    }
    
    NSString *result = [string stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if (result.length > 0 && ![result isEqualToString:@"."]) {
        return NO;
    }
    
    return YES;
}

#pragma mark - 把对象转化成NSDecimalNumber类型
+ (NSDecimalNumber *)convertToDecimalNumber:(id)number {
    if (!number) {
        return [NSDecimalNumber decimalNumberWithString:@"0"];
    }
    
    if ([number isKindOfClass:[NSNumber class]]) {
        NSDecimalNumber *decimalNumber;
        if ([number isMemberOfClass:[NSDecimalNumber class]]) {
            decimalNumber = number;
        } else {
            decimalNumber = [NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%@", number]];
        }
        return decimalNumber;
    } else if ([number isKindOfClass:[NSString class]] && [self isPureNumber:number]) {
        NSString *numberConvert = [number stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if (numberConvert.length == 0) {
            return [NSDecimalNumber decimalNumberWithString:@"0"];
        } else {
            return  [NSDecimalNumber decimalNumberWithString:numberConvert];
        }
    } else {
        return [NSDecimalNumber decimalNumberWithString:@"0"];
    }
}

#pragma mark - 创建需保存的精度Handler
+ (NSDecimalNumberHandler *)createSimpleRoundPlainByScale:(NSInteger)scale {
    return [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain
                                                                  scale:scale
                                                       raiseOnExactness:NO
                                                        raiseOnOverflow:NO
                                                       raiseOnUnderflow:NO
                                                    raiseOnDivideByZero:YES];
}

#pragma mark - 把传入数组的所有数值相乘
+ (NSDecimalNumber *)multiplyByIdParameter:(NSArray *)idParameterArray {
    NSMutableArray *decimalNumberArray = [[NSMutableArray alloc] init];
    for (id idItem in idParameterArray) {
        NSDecimalNumber *decimalItem = [self convertToDecimalNumber:idItem];
        if (!decimalItem) {
            return [NSDecimalNumber decimalNumberWithString:@"0"];
        }
        [decimalNumberArray addObject:decimalItem];
    }
    
    if (decimalNumberArray.count == 0) {
        return [NSDecimalNumber decimalNumberWithString:@"0"];
    }
    
    NSDecimalNumber *result = [NSDecimalNumber decimalNumberWithString:@"1"];
    for (NSDecimalNumber *item in decimalNumberArray) {
        if (!item) {
            return [NSDecimalNumber decimalNumberWithString:@"0"];
        }
        result = [result decimalNumberByMultiplyingBy:item];
    }
    
    return result;
}

@end
