//
//  NSString+NumbersLatinized.m
//  CategoryTestBed
//
//  Created by Arabia -IT on 11/26/17.
//  Copyright © 2017 Arabia-IT. All rights reserved.
//

#import "NSString+NumbersLatinized.h"

@implementation NSString (NumbersLatinized)

- (NSString *)stringWithNumbersLatinized {
    NSString* selfASNSString = self;
    NSString* pattern = @"\\d+";
    NSError* error;
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:pattern options:kNilOptions error:&error];
    if (error) {
        NSLog(@"Error in creating regex with pattern: %@ in string: %@", pattern, selfASNSString);
        return self;
    }
    
    NSArray<NSTextCheckingResult*>* matches = [regex matchesInString:selfASNSString options:kNilOptions range:NSMakeRange(0, selfASNSString.length)];
    for (NSTextCheckingResult* match in matches) {
        selfASNSString = [selfASNSString stringByReplacingCharactersInRange:match.range withString:[NSString stringWithFormat:@"%ld", (long)[selfASNSString substringWithRange:match.range].integerValue]];
    }
    
    return selfASNSString;
}

@end
