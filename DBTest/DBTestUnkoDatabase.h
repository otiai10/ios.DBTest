//
//  DBTestUnkoDatabase.h
//  DBTest
//
//  Created by Hiromu Ochiai on 12/26/13.
//  Copyright (c) 2013 otiai10. All rights reserved.
//

#import <Foundation/Foundation.h>

// sqliteをimportして使えるようにする
#import <sqlite3.h>

// Databaseへアクセスするクラスの宣言を行う
// ここで宣言したプロパティやメソッドは、.mファイルで実装しなければならない
@interface DBTestUnkoDatabase : NSObject {
    sqlite3 *_singletonInstance;
}

+(DBTestUnkoDatabase*)myDatabase;
-(NSArray *)unkoInfos;
-(DBTestUnkoDatabase*)prepare;

@end