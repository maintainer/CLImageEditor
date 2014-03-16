//
//  CLImageEditorTheme.m
//
//  Created by sho yakushiji on 2013/12/05.
//  Copyright (c) 2013年 CALACULU. All rights reserved.
//

#import "CLImageEditorTheme.h"
#import "VSThemeLoader.h"


@implementation CLImageEditorTheme

#pragma mark - singleton pattern

static CLImageEditorTheme *_sharedInstance = nil;

+ (CLImageEditorTheme*)theme
{
    static dispatch_once_t  onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[CLImageEditorTheme alloc] init];
    });
    return _sharedInstance;
}

+ (id)allocWithZone:(NSZone *)zone
{
    @synchronized(self) {
        if (_sharedInstance == nil) {
            _sharedInstance = [super allocWithZone:zone];
            return _sharedInstance;
        }
    }
    return nil;
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        VSThemeLoader *themeLoader = [VSThemeLoader new];
        VSTheme *theme = themeLoader.defaultTheme;

        NSString *bundleName = [theme stringForKey:@"CLImageEditorBundleName"];
        self.bundleName = bundleName ? bundleName : @"CLImageEditor";
        UIColor *backgroundColor = [theme colorForKey:@"CLImageEditorBackgroundColor"];
        self.backgroundColor = backgroundColor ? backgroundColor : [UIColor whiteColor];
        UIColor *toolbarColor = [theme colorForKey:@"CLImageEditorToolbarColor"];
        self.toolbarColor = toolbarColor ? toolbarColor : [UIColor colorWithWhite:1 alpha:0.8];
        UIColor *toolbarTextColor = [theme colorForKey:@"CLImageEditorToolbarTextColor"];
        self.toolbarTextColor = toolbarTextColor ? toolbarTextColor : [UIColor blackColor];
        UIColor *toolbarSelectedButtonColor = [theme colorForKey:@"CLImageEditorToolbarSelectedButtonColor"];
        self.toolbarSelectedButtonColor = toolbarSelectedButtonColor ? toolbarSelectedButtonColor : [[UIColor cyanColor] colorWithAlphaComponent:0.2];
        UIFont *toolbarTextFont = [theme fontForKey:@"CLImageEditorToolbarTextFont"];
        self.toolbarTextFont = toolbarTextFont ? toolbarTextFont : [UIFont systemFontOfSize:10];
    }
    return self;
}

@end
