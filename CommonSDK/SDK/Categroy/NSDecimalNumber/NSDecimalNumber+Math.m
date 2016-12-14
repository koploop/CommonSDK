//
//  NSDecimalNumber+Math.m
//  CommonSDK
//
//  Created by Weelh on 2016/12/1.
//  Copyright © 2016年 Weelh. All rights reserved.
//

#import "NSDecimalNumber+Math.h"
#import "CommonMathPreciousFunction.h"

@implementation NSDecimalNumber (Math)

#pragma mark - 加法
- (NSDecimalNumber *)xAdd:(id)number {
    NSDecimalNumber *result = XMathAdd(self, number, nil);
    
    if (!result) {
        return [NSDecimalNumber decimalNumberWithString:@"0"];
    }
    return result;
}

#pragma mark - 减法
- (NSDecimalNumber *)xSubtract:(id)number {
    NSDecimalNumber *result = XMathSubtract(self, number);
    
    if (!result) {
        return [NSDecimalNumber decimalNumberWithString:@"0"];
    }
    
    return result;
}

#pragma mark -乘法
- (NSDecimalNumber *) xMultiply:(id)number {
    NSDecimalNumber *result = XMathMultiply(0, self, number, nil);
    
    if (!result) {
        return [NSDecimalNumber decimalNumberWithString:@"0"];
    }
    
    return result;
}

#pragma mark - 除法
- (NSDecimalNumber *)xDivide:(id)number {
    NSDecimalNumber *result = XMathDivide(0, self, number);
    
    if (!result) {
        return [NSDecimalNumber decimalNumberWithString:@"0"];
    }
    
    return result;
}

@end
