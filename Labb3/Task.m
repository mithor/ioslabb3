//
//  Task.m
//  Labb3
//
//  Created by IT-Högskolan on 2015-02-09.
//  Copyright (c) 2015 IT-Högskolan. All rights reserved.
//

#import "Task.h"

@implementation Task

- (id)initWithName:(NSString*)name important:(BOOL)important {
    self = [super init];
    if (self) {
        self.name = name;
        self.important = important;
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (self) {
        self.name = [decoder decodeObjectForKey:@"name"];
        self.important = [decoder decodeBoolForKey:@"important"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeBool:self.important forKey:@"important"];
    }

@end
