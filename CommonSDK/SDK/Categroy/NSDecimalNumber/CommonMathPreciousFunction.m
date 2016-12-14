//
//  CommonMathPreciousFunction.m
//  CommonSDK
//
//  Created by Weelh on 2016/12/1.
//  Copyright © 2016年 Weelh. All rights reserved.
//

#import "CommonMathPreciousFunction.h"
#import "CommonPreciseHelper.h"

@interface CommonMathPreciousFunction ()

@property (nonatomic, strong) NSDecimalNumberHandler *roundPlainScale2;

@property (nonatomic, strong) NSDecimalNumberHandler *roundPlainScale3;

@end

@implementation CommonMathPreciousFunction

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    static CommonMathPreciousFunction *instance;
    
    dispatch_once(&onceToken, ^{
        instance = [[CommonMathPreciousFunction alloc] init];
    });
    
    return instance;
}

- (NSDecimalNumberHandler *)roundPlainScale2 {
    if (!_roundPlainScale2) {
        _roundPlainScale2 = [CommonPreciseHelper createSimpleRoundPlainByScale:2];
    }
    
    return  _roundPlainScale2;
}

- (NSDecimalNumberHandler *)roundPlainScale3 {
    if (!_roundPlainScale3) {
        _roundPlainScale3 = [CommonPreciseHelper createSimpleRoundPlainByScale:3];
    }
    
    return  _roundPlainScale3;
}

+ (NSDecimalNumberHandler *)createRoundPlainWithScale:(NSInteger)scale {
    if (scale <= 0) {
        return nil;
    } else if (scale == 2) {
        return [CommonMathPreciousFunction shareInstance].roundPlainScale2;
    } else if (scale == 3) {
        return [CommonMathPreciousFunction shareInstance].roundPlainScale3;
    } else {
        return [CommonPreciseHelper createSimpleRoundPlainByScale:scale];
    }
}

#pragma mark - 创建NSDecimalNumber类型对象
NSDecimalNumber * XMathCreateDecimalByNumber(id number) {
    if ([number isKindOfClass:[NSDecimalNumber class]]) {
        return [NSDecimalNumber decimalNumberWithString:((NSDecimalNumber *)number).stringValue];
    } else {
        return [CommonPreciseHelper convertToDecimalNumber:number];
    }
}

#pragma mark - 返回指定精度
NSDecimalNumber * XMathRounding(NSInteger scale, id number) {
    NSDecimalNumber *result = [CommonPreciseHelper convertToDecimalNumber:number];
    NSDecimalNumberHandler *roundPlainScale = [CommonMathPreciousFunction createRoundPlainWithScale:scale];
    
    if (!result) {
        return [NSDecimalNumber decimalNumberWithString:@"0"];
    }
    
    return [result decimalNumberByRoundingAccordingToBehavior:roundPlainScale];
}

NSString * XMathRoundingToString(NSInteger scale ,id number) {
    NSDecimalNumber *result = [CommonPreciseHelper convertToDecimalNumber:number];
    NSDecimalNumberHandler *roundPlainScale = [CommonMathPreciousFunction createRoundPlainWithScale:scale];
    
    if (!result) {
        return @"0.00";
    }
    
    result = [result decimalNumberByRoundingAccordingToBehavior:roundPlainScale];
    
    if (scale == 0) {
        return result.stringValue;
    } else {
        NSString *param = [NSString stringWithFormat:@"%%.%zilf", scale];
        return [NSString stringWithFormat:param, result.doubleValue];
    }
}

#pragma mark - 加法
NSDecimalNumber * XMathAdd(id numberA, id numberB, ...) {
    NSMutableArray *idParameters = [[NSMutableArray alloc] init];
    va_list params;
    id argument;
    
    if (!numberA) {
        return [NSDecimalNumber decimalNumberWithString:@"0"];
    }
    
    [idParameters addObject:numberA];
    
    if (numberB) {
        [idParameters addObject:numberB];
        va_start(params, numberB);
        while ((argument = va_arg(params, id))) {
            [idParameters addObject:argument];
        }
        va_end(params);
    }
    
    NSDecimalNumber *result = [NSDecimalNumber decimalNumberWithString:@"0"];
    for (id numberItem in idParameters) {
        NSDecimalNumber *decimalItem = [CommonPreciseHelper convertToDecimalNumber:numberItem];
        
        if (!decimalItem) {
            return [NSDecimalNumber decimalNumberWithString:@"0"];
        }
        
        result = [result decimalNumberByAdding:decimalItem];
    }
    
    return result;
}

#pragma mark - 减法
NSDecimalNumber * XMathSubtract(id numberA, id numberB) {
    NSDecimalNumber *decimalNumberA = [CommonPreciseHelper convertToDecimalNumber:numberA];
    NSDecimalNumber *decimalNumberB = [CommonPreciseHelper convertToDecimalNumber:numberB];
    
    if (!decimalNumberA || !decimalNumberB) {
        return [NSDecimalNumber decimalNumberWithString:@"0"];
    }
    
    return [decimalNumberA decimalNumberBySubtracting:decimalNumberB];
}

#pragma mark - 乘法
NSDecimalNumber * XMathMultiply(NSInteger scale, id numberA, id numberB, ...) {
    NSDecimalNumberHandler *roundPlainScale = [CommonMathPreciousFunction createRoundPlainWithScale:scale];
    NSMutableArray *idParameters = [[NSMutableArray alloc] init];
    va_list params;
    id argument;
    
    if (!numberA) {
        return [NSDecimalNumber decimalNumberWithString:@"0"];
    }
    
    [idParameters addObject:numberA];
    
    if (numberB) {
        [idParameters addObject:numberB];
        va_start(params, numberB);
        while ((argument = va_arg(params, id))) {
            [idParameters addObject:argument];
        }
        va_end(params);
    }
    
    if (roundPlainScale) {
        return [[CommonPreciseHelper multiplyByIdParameter:idParameters] decimalNumberByRoundingAccordingToBehavior:roundPlainScale];
    } else {
        return [CommonPreciseHelper multiplyByIdParameter:idParameters];
    }
    
    return nil;
}

#pragma mark - 除法
NSDecimalNumber * XMathDivide(NSInteger scale, id numberA, id numberB) {
    NSDecimalNumberHandler *roundPlainScale = [CommonMathPreciousFunction createRoundPlainWithScale:scale];
    
    NSDecimalNumber *decimalNumberA = [CommonPreciseHelper convertToDecimalNumber:numberA];
    NSDecimalNumber *decimalNumberB = [CommonPreciseHelper convertToDecimalNumber:numberB];
    
    if (!decimalNumberA || !decimalNumberB || [decimalNumberB compare:@(0)] == NSOrderedSame) {
        return [NSDecimalNumber decimalNumberWithString:@"0"];
    }
    
    if (roundPlainScale) {
        return [decimalNumberA decimalNumberByDividingBy:decimalNumberB withBehavior:roundPlainScale];
    } else {
        return [decimalNumberA decimalNumberByDividingBy:decimalNumberB];
    }
}

@end
