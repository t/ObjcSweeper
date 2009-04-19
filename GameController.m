//
//  GameController.m
//  MineSweeper
//
//  Created by t on 09/04/13.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "GameController.h"
#import "CellButton.h"

@implementation GameController

- (id) init
{
  if( self = [super init]){
    cells_ = [NSMutableArray array];
    [cells_ retain];
    isInitedCells = NO;
  }
  return self;
}

- (void) dealloc
{
  [cells_ release];
  [super dealloc];
}

- (void) initCells : (CellButton *) sender
{
  int MINE_COUNT = 16;
  for(int i = 0; i < MINE_COUNT; i++){
    while(1){
      int rand = random() % [cells_ count];      
      CellButton * cell = [cells_ objectAtIndex:rand];
      if(cell != sender && !cell.isMine){
        cell.isMine = YES;
        break;
      }
    }
  }
  isInitedCells = YES;
}

- (void) clickCell : (CellButton *) sender
{
  if(! isInitedCells) [self initCells: sender];
  [sender open];
}

-(void)loadView
{
  [super loadView];
	
  UIView * contentView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
  contentView.backgroundColor = [UIColor whiteColor];

  int WIDTH  = 16;
  int HEIGHT = 16;
	for(int x = 0; x < WIDTH; x++)	{
		for(int y = 0; y < HEIGHT; y++){
			CellButton * cell = [[CellButton alloc] init]; 
			[cell setFrame:CGRectMake(x * 18.0f, y * 18.0f, 18.0f, 18.0f)];
			//[cell setCenter:CGPointMake(160.0f, 208.0f)];
			[cell addTarget:self action:@selector(clickCell:) forControlEvents:UIControlEventTouchUpInside];
			[contentView addSubview: cell];
      [cells_ addObject: cell];	
      [cell release];
		}
	}		  

	for(int x = 0; x < WIDTH; x++)	{
		for(int y = 0; y < HEIGHT; y++){
      CellButton * cell = [cells_ objectAtIndex:(x + y * WIDTH)];      
      for(int i = -1; i <= 1; i++){
        for(int j = -1; j <= 1; j++){
          if(x + i < 0 || x + i >= WIDTH)  continue;
          if(y + j < 0 || y + j >= HEIGHT) continue;
          
          CellButton * cell_to = [cells_ objectAtIndex:( (x+i) + (y+j) * WIDTH)];
          [cell addRoundCell:cell_to];
          if(i == 0 || y == 0){
            [cell addAdjCell:cell_to];            
          }
        }
      }
		}
	}		  
  
	self.view = contentView;
	[contentView release];
}

@end
