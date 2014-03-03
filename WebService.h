//
// Created by Alexey Ushakov on 1/27/14.
// Copyright (c) 2014 jetbrains. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface WebService : NSObject

/**
Validate text. Returns true if the validation has been successfully performed on the server.

@param text - the text to validate

@param result - pointer-to-pointer to NSArray with spelling errors

@param error - pointer-to-pointer to NSError for web service error handling
*/

@property (copy) NSArray *array;

- (instancetype)initWithArray:(NSArray *)array;

+ (instancetype)serviceWithArray:(NSArray *)array;

+ (BOOL)validateText:(NSString *)text result:(NSArray **)result error:(NSError **)error;
@end