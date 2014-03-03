//
// Created by Alexey Ushakov on 1/27/14.
// Copyright (c) 2014 jetbrains. All rights reserved.
//

#import "WebService.h"
#import "WebServiceDelegate.h"


@implementation WebService {

}
- (instancetype)initWithArray:(NSArray *)array {
    self = [super init];
    if (self) {
        self.array = array;
    }

    return self;
}

+ (instancetype)serviceWithArray:(NSArray *)array {
    return [[self alloc] initWithArray:array];
}


+(NSString*) encodeToPercentEscapeString:(NSString*) string {
  return (__bridge NSString *)
          CFURLCreateStringByAddingPercentEscapes(NULL,
                  (__bridge CFStringRef) string,
                  NULL,
                  (CFStringRef) @"!*'();:@&=+$,/?%#[]",
                  kCFStringEncodingUTF8);
}


+ (BOOL)validateText:(NSString *)text
            result:(NSArray **)result
             error:(NSError **)error {

  NSString *REQ_STR = @"http://speller.yandex.net/services/spellservice.json/checkText";

  NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
  WebServiceDelegate *wsDelegate = [[WebServiceDelegate alloc] init];

  [request setURL:[NSURL URLWithString:REQ_STR]];
  [request setHTTPMethod:@"POST"];
  [request setTimeoutInterval:60.0];

  NSString *pStr = [NSString stringWithFormat:@"text=%@",
                  [WebService encodeToPercentEscapeString:text]];

  NSData *postData = [pStr dataUsingEncoding:NSUTF8StringEncoding
                        allowLossyConversion:YES];


  NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];

  [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
  [request setValue:@"application/x-www-form-urlencoded"
 forHTTPHeaderField:@"Content-Type"];
  [request setHTTPBody:postData];

  wsDelegate.requestStarted = YES;

  [NSURLConnection connectionWithRequest:request delegate:wsDelegate];

  while (!(wsDelegate.requestCompleted || wsDelegate.requestFailed)) {
      [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                               beforeDate:[NSDate distantFuture]];
  }

  if (wsDelegate.requestFailed) return NO;

  (*result) =
          [NSJSONSerialization JSONObjectWithData:wsDelegate.receivedData
                                          options:0 error:(__autoreleasing NSError **)error];

  return *error == nil;
}

@end
