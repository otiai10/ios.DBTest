//
//  DBTestUnkoInfo.m
//  DBTest
//
//  Created by Hiromu Ochiai on 12/26/13.
//  Copyright (c) 2013 otiai10. All rights reserved.
//

#import "DBTestUnkoInfo.h"

// .hファイルで宣言したプロパティやメソッドの実装を行う
@implementation DBTestUnkoInfo

@synthesize uid = _uid;
@synthesize ownerName = _ownerName;

- (id)init:(int)uid ownerName:(NSString *)ownerName {
    // NSObject.initを呼んでインスタンスを得る
    self = [super init];
    // 各プロパティを充たしていく
    self.uid = uid;
    self.ownerName = ownerName;
    // インスタンスを返す
    return self;
}

@end
