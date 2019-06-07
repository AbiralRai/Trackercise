//
//  Plist.m
//  Trackercise
//
//  Created by Abiral Rai on 7/6/19.
//  Copyright © 2019 Abiral Rai. All rights reserved.
//

#import "Plist.h"

@implementation Plist


//Convert Object (Dictionary, Array) to Plist(NSData)
+ (NSData *) objToPlistAsData:(id)obj
{
    NSError * error = nil;
    NSPropertyListFormat format = NSPropertyListXMLFormat_v1_0;
    NSData * data = [NSPropertyListSerialization dataWithPropertyList:obj format:format options:NSPropertyListImmutable error:&error];
    return data;
}

//Convert Object (Dictionary, Array) to Plist(NSString)
+ (NSString *) objToPlistAsString:(id)obj
{
    NSData * data = [self objToPlistAsData:obj];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

//Convert Plist(NSData) to Object (Array, Dictionary)
+(id) plistToObjectFromData:(NSData *)data
{
    NSError * error=nil;
    NSPropertyListFormat format=NSPropertyListXMLFormat_v1_0;
    id plist = [NSPropertyListSerialization propertyListWithData:data
                                                         options:NSPropertyListImmutable
                                                          format:&format error:&error] ;
    
    return plist;
}

//Convert Plist(NSString) to Object (Array,Dictionary)
+(id) plistToObjectFromString:(NSString *)str
{
    NSData * data =[str dataUsingEncoding:NSUTF8StringEncoding];
    return [self plistToObjectFromData:data];
}

@end
