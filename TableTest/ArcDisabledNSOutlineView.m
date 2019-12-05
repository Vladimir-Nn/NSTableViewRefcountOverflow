//
//  ArcDisabledNSOutlineView.m
//  TableTest
//
//  Created by Developer N on 12/4/19.
//  Copyright © 2019 Developer N. All rights reserved.
//

#import "ArcDisabledNSOutlineView.h"

// The class was added to figure out retainCount limit only.

@implementation ArcDisabledNSOutlineView

- (instancetype)retain {
    if (self.retainCount % 1000000 == 0) {
        NSLog(@"%zd = = %s, %lu, %@", self.retainCount, __PRETTY_FUNCTION__, sizeof(self.retainCount), self);
    }
    return [super retain];
}

@end
