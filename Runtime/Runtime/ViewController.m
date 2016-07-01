//
//  ViewController.m
//  Runtime
//
//  Created by yinhexin on 16/6/29.
//  Copyright © 2016年 yinhexin. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import <Foundation/Foundation.h>
#import "People.h"
@interface ViewController ()

@end

IMP  cfunctionPoint;
IMP  cfunctionPoint1;
IMP  cfunctionPoint2;
@implementation ViewController



- (void)viewDidLoad {
    People *people = [[People alloc] init];
    
    [super viewDidLoad];
    [self methodExchange];
    [self customClassExchange];
    [people jump2];
    // Do any additional setup after loading the view, typically from a nib.
}
// 系统类的方法实现部分替换
- (void)methodExchange {
    // 大写字母
    Method method =  class_getInstanceMethod([NSString class], @selector(lowercaseString));
    Method method1 = class_getInstanceMethod([NSString class], @selector(uppercaseString));
    method_exchangeImplementations(method, method1);
    NSLog(@"%@",[@"ssssAAAAss" lowercaseString]);
    NSLog(@"%@",[@"ssssAAAAss" uppercaseString]);
}
//交换部分类的视线
- (void)customClassExchange {
    Method m1 = class_getInstanceMethod([People class], @selector(jump1));
    IMP originalImp = method_getImplementation(m1);
    Method m2 = class_getInstanceMethod([People class], @selector(jump2));
    method_setImplementation(m2, originalImp);
    
    
    
}
    NSString * customUppercaseString (id self, SEL  _cmd) {
        NSString * string = nil;
        return string;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
