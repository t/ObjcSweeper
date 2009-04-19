//
//  MineSweeperAppDelegate.m
//  MineSweeper
//
//  Created by t on 09/04/12.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MineSweeperAppDelegate.h"
#import "HomeController.h"

@implementation MineSweeperAppDelegate

-(void) applicationDidFinishLaunching:(UIApplication *) application {
  UIWindow *window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]]; 
  UINavigationController * nav = 
  [[UINavigationController alloc] initWithRootViewController:[[HomeController alloc] init]];
  [window addSubview: nav.view];
  [window makeKeyAndVisible];
}

- (void)dealloc{
  [super dealloc];
}

@end
