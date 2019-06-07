//
//  Plist.h
//  Trackercise
//
//  Created by Abiral Rai on 7/6/19.
//  Copyright © 2019 Abiral Rai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Plist : NSObject

//Convert Object (Dictionary, Array) to Plist(NSData)
+ (NSData *) objToPlistAsData:(id)obj;

//Convert Object (Dictionary, Array) to Plist(NSString)
+ (NSString *) objToPlistAsString:(id)obj;

//Convert Plist(NSData) to Object (Array, Dictionary)
+(id) plistToObjectFromData:(NSData *)data;

//Convert Plist(NSString) to Object (Array,Dictionary)
+(id) plistToObjectFromString:(NSString *)str;

@end

NS_ASSUME_NONNULL_END
