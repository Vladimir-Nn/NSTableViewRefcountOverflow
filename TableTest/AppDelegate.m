//
//  AppDelegate.m
//  TableTest
//
//  Created by Developer N on 12/4/19.
//  Copyright © 2019 Developer N. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate () <NSOutlineViewDelegate, NSOutlineViewDataSource>

@property (weak) IBOutlet NSOutlineView *outlineView;
@property (weak) IBOutlet NSWindow *window;

@end

@implementation AppDelegate

NSString * const SIFTFilePresentationViewIdentifier = @"sift:file presentation";

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [self registerCells];// < - - - Commenting only this line fixes the issue.
    
    self.outlineView.delegate = self;
    self.outlineView.dataSource = self;
}

- (void)registerCells {
    NSNib *nib = [[NSNib alloc] initWithNibNamed:@"SIFTFileView" bundle:nil];
    [self.outlineView registerNib:nib forIdentifier:SIFTFilePresentationViewIdentifier];
}

- (NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item {
    if (item == nil) {
        //Works fine:
        //10.14.5 (18F132)
        //MacBook Pro (15-inch, 2017)
        
        //Crashes:
        //10.15.1 (19B88)
        //MacBook Pro (15-inch, 2018)
        
        //2^25 = 33554432
        return 33560000;
    } else {
        return 0;
    }
}

- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(id)item {
    if (item == nil) {
        return @"321";
    } else {
        return nil;
    }
}

- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item {
    return item == nil;
}

- (BOOL)outlineView:(NSOutlineView *)outlineView isGroupItem:(id)item {// < - - - Commenting only this method fixes the issue.
    return item == nil;
}

@end
