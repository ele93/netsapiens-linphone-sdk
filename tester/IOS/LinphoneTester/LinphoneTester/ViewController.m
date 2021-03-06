//
//  ViewController.m
//  LinphoneTester
//
//  Created by Danmei Chen on 13/02/2019.
//  Copyright © 2019 belledonne. All rights reserved.
//

#import "ViewController.h"
#import "Log.h"
#include "TargetConditionals.h"
#include "linphonetester/liblinphone_tester.h"


@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    liblinphone_tester_init(NULL);
    [Log enableLogs:ORTP_DEBUG];
    liblinphone_tester_keep_accounts(TRUE);
    
    NSString *bundlePath = [NSString stringWithFormat:@"%@/liblinphone_tester/", [[NSBundle mainBundle] bundlePath]] ;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *writablePath = [paths objectAtIndex:0];
    
    bc_tester_set_resource_dir_prefix([bundlePath UTF8String]);
    bc_tester_set_writable_dir_prefix([writablePath UTF8String]);
}

@end
