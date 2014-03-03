//
//  SpellViewController.m
//  SpellCheck
//
//  Created by Alexey Ushakov on 2/27/14.
//  Copyright (c) 2014 jetbrains. All rights reserved.
//

#import "SpellViewController.h"
#import "WebService.h"

@interface SpellViewController ()

@property(nonatomic) IBOutlet UILabel *myOutput;
@property(nonatomic) IBOutlet UITextView *myInput;

@end

@implementation SpellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doCheck:(id)sender {
    NSError *error = nil;
    NSArray *array = @[];
    if (![WebService validateText:self.myInput.text result:&array error:&error]) {

        self.myOutput.text = @"Service is not available";
        return;
    }


    self.myOutput.text = [NSString stringWithFormat:@"Found %d error(s)", array.count];
}
@end