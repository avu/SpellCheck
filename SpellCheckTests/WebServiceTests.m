//
//  WebServiceTests.m
//  WebServiceTests
//
//  Created by Alexey Ushakov on 2/27/14.
//  Copyright (c) 2014 jetbrains. All rights reserved.
//

#import "WebServiceTests.h"
#import "WebService.h"

@implementation WebServiceTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    NSError *error = nil;
    NSArray *array = @[];
    if (![WebService validateText:@"Quick brown fox" result:&array error:&error]){

        STFail(@"Service is not available");
        return;
    }

    STAssertTrue(array.count == 0, @"Invalid result");
}

@end
