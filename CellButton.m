//
//  CellButton.m
//  MineSweeper
//
//  Created by t on 09/04/18.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "CellButton.h"

@implementation CellButton
- (id) init
{
  if( self = [super init]){   
    round_cells_ = [[NSMutableArray array] retain];
    adj_cells_   = [[NSMutableArray array] retain];
    isMine       = NO;
    isOpened     = NO;
    
    [self setBackgroundImage:[[UIImage imageNamed:@"tile1.gif"]
                              stretchableImageWithLeftCapWidth:18.0 topCapHeight: 0.0]
                    forState: UIControlStateNormal];
    
    [self setBackgroundImage:[[UIImage imageNamed:@"tile2.gif"]
                              stretchableImageWithLeftCapWidth:18.0 topCapHeight: 0.0]
                    forState: UIControlStateHighlighted];

  }
  return self;
}

- (void) dealloc
{
  [round_cells_ release];
  [adj_cells_   release];
  [super dealloc];
}

- (void) addRoundCell: (CellButton *) cell
{
  [round_cells_ addObject: cell];			  
}


- (void) addAdjCell: (CellButton *) cell
{
  [adj_cells_ addObject: cell];			  
}

- (int) getValue
{
  if(isMine) return -1;
  
  int value = 0;
  for(CellButton * cell in round_cells_){
    if([cell isMine]){
      value++;
    }
  }
  return value;
}

- (int) open
{  
  int value = [self getValue];
  if(isOpened) return value;
  isOpened = YES;

  if(value > 0){
    [self setTitle:[NSString stringWithFormat:@"%i", value] forState:UIControlStateNormal];
    [self setTitle:[NSString stringWithFormat:@"%i", value] forState:UIControlStateHighlighted];
  }else if(value == -1){
    [self setTitle:@"X" forState:UIControlStateNormal];
    [self setTitle:@"X" forState:UIControlStateHighlighted];    
  }
  [self setBackgroundImage:[[UIImage imageNamed:@"tile2.gif"]
                            stretchableImageWithLeftCapWidth:18.0 topCapHeight: 0.0]
                  forState: UIControlStateNormal];  

  if(value == 0){
    for(CellButton * cell in round_cells_){
      [cell open];
    }    
  }
  
  
  return value;
}

- (void) markFlag
{ 
}

@synthesize isMine;

@end