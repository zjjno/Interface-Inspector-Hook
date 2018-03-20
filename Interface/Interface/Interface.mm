//
//  Interface.m
//  Interface
//
//  Created by In8 on 2018/3/20.
//  Copyright © 2018年 In8. All rights reserved.
//

#import "CaptainHook.h"

CHDeclareClass(SMLicenseManager);
CHMethod(1, void, SMLicenseManager, setLicensed, BOOL, arg1)
{
    NSLog(@"========== setLicensed");
    CHSuper(1, SMLicenseManager, setLicensed, YES);
}

CHMethod(0, BOOL, SMLicenseManager, isLicensed)
{
    NSLog(@"========== isLicensed");
    return YES;
}

CHDeclareClass(NSBundle);

CHMethod(0, int, NSBundle, codeSignState)
{
    NSLog(@"========== codeSignState");
    return 2;
}

CHConstructor // code block that runs immediately upon load
{
    @autoreleasepool
    {
        NSLog(@"========== CaptainHook.h");
        
        CHLoadLateClass(SMLicenseManager);
        CHClassHook(0, SMLicenseManager, isLicensed);
        CHClassHook(1, SMLicenseManager, setLicensed);
        
        CHLoadLateClass(NSBundle);
        CHClassHook(0, NSBundle, codeSignState);
    }
}
