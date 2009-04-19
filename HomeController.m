//
//  MainController.m
//  Flickr Uploader
//
//  Created by t on 09/04/05.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/NSBundle.h>
#import "HomeController.h"
#import "GameController.h"

@implementation HomeController

- (void) newGame
{
	[[self navigationController] pushViewController:[[GameController alloc] init] animated:YES];	
}

-(void)loadView
{
 [super loadView];
	
  UIView * contentView = [[[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]] autorelease];
	contentView.backgroundColor = [UIColor whiteColor];
	
  /*
  self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc]
                                             initWithTitle: @"New Game"
											   style:UIBarButtonItemStylePlain
											   target:self
											   action:@selector(newGame)]
								   			   autorelease];
  */
	
  UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [button setFrame:CGRectMake(100.0f, 100.0f, 80.0f, 30.0f)];
  [button setTitle:@"New Game" forState:UIControlStateNormal];
  [button addTarget:self action:@selector(newGame) forControlEvents:UIControlEventTouchUpInside];
  [contentView addSubview:button];    	 
	
  self.view = contentView;
}

@end
