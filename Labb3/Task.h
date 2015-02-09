//
//  Task.h
//  Labb3
//
//  Created by IT-Högskolan on 2015-02-09.
//  Copyright (c) 2015 IT-Högskolan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) BOOL important;

- (id)initWithName:(NSString*)name important:(BOOL)important;
- (id)initWithCoder:(NSCoder *)decoder;
- (void)encodeWithCoder:(NSCoder *)encoder;

@end

