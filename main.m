#import <UIKit/UIKit.h>

@class UIImageView;

int main(int argc, char *argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, @"MineSweeperAppDelegate");
    [pool release];
    return retVal;	
}

