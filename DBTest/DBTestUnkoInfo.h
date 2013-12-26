//
//  DBTestUnkoInfo.h
//  DBTest
//
//  Created by Hiromu Ochiai on 12/26/13.
//  Copyright (c) 2013 otiai10. All rights reserved.
//

#import <Foundation/Foundation.h>

// DBTestUnkoInfoクラスのプロパティとメソッドの宣言を行う
// ここで宣言したプロパティやメソッドは、.mファイルで実装しなければならない
@interface DBTestUnkoInfo : NSObject {
    int _uid;
    NSString *_ownerName;
}

@property (nonatomic, assign) int uid;
@property (nonatomic, copy) NSString *ownerName;

- (id)init:(int)uid ownerName:(NSString *)ownerName;

@end
