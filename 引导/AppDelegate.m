//
//  AppDelegate.m
//  引导
//
//  Created by yons on 14/12/17.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "AppDelegate.h"
#import "ZATabBarViewController.h"
#import "ZCControl.h"
#define WINDOWWIDTH  self.window.frame.size.width
#define WINDOWHEIGHT  self.window.frame.size.height
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    
    
    
    NSUserDefaults*defaults=[NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"first"]) {
        [self buttonClick];
    }else{
        _scrollView=[self helperView];
        [self.window addSubview:_scrollView];
    }
    
    
    
    
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}
#pragma mark 引导页
-(UIScrollView*)helperView{
    UIScrollView*scrollView=[[UIScrollView alloc]initWithFrame:self.window.frame];
    scrollView.contentSize=CGSizeMake(WINDOWWIDTH*4, WINDOWHEIGHT);
    scrollView.showsHorizontalScrollIndicator=NO;
    scrollView.showsVerticalScrollIndicator=NO;
    //关闭反弹
    scrollView.bounces=NO;
    //分页
    scrollView.pagingEnabled=YES;
    //设置引导页
    NSArray*array=@[@"helpphoto_one",@"helpphoto_two",@"helpphoto_three",@"helpphoto_four"];
    for (int i=0; i<4; i++) {
        UIImageView*imageView = [ZCControl createImageViewWithFrame:CGRectMake(WINDOWWIDTH*i, 0, WINDOWWIDTH, WINDOWHEIGHT) ImageName:nil];
        if (WINDOWHEIGHT == 480) {
            imageView.image = [UIImage imageNamed:array[i]];
        }else{
            imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@640_1136.png",array[i]]];
        }
        [scrollView addSubview:imageView];
        if (i==3) {
            UIButton*button=[ZCControl createButtonWithFrame:CGRectMake(WINDOWWIDTH/2-40, WINDOWHEIGHT-60, 80, 40) ImageName:nil Target:self Action:@selector(buttonClick) Title:@"尽情体验"];
            button.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
            button.layer.masksToBounds = YES;
            button.layer.cornerRadius = 10;
            [imageView addSubview:button];
        }
    }
    return scrollView;
}
#pragma mark 引导页最后进入主界面
-(void)buttonClick{
    
    [UIView animateWithDuration:0.5 animations:^{
        if (_scrollView) {
            _scrollView.alpha=0;
            [_scrollView removeFromSuperview];
        }
        NSUserDefaults*defaults=[NSUserDefaults standardUserDefaults];
        //引导页只运行一次 需要限制时取消注释
        [defaults setObject:@"1" forKey:@"first"];
        [defaults synchronize];
    }];
    //进入主程序
    ZATabBarViewController * vc = [[ZATabBarViewController alloc]init];
    self.window.rootViewController = vc;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
