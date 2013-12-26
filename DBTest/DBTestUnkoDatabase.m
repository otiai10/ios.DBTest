//
//  DBTestUnkoDatabase.m
//  DBTest
//
//  Created by Hiromu Ochiai on 12/26/13.
//  Copyright (c) 2013 otiai10. All rights reserved.
//

#import "DBTestUnkoDatabase.h"

// Unko１レコードの定義に対応するクラス定義をimportする
#import "DBTestUnkoInfo.h"

@implementation DBTestUnkoDatabase

static DBTestUnkoDatabase *_singletonInstance;

+(DBTestUnkoDatabase*)myDatabase {
    if (_singletonInstance == nil) {
        _singletonInstance = [[DBTestUnkoDatabase alloc] init];
    }
    return _singletonInstance;
}

-(id)init {
    // インスタンスを取得
    self = [super init];

    // sqliteデータリソースの場所を明示する
    NSString *sqLiteDb = [[NSBundle mainBundle] pathForResource:@"unkolist" ofType:@"sqlite3"];
    
    // sqlite3_open!!!!!!!!!!!!!
    if (sqlite3_open([sqLiteDb UTF8String], &_singletonInstance) != SQLITE_OK) {
        NSLog(@"えええええええええなんかsqlite開けなかったんだけどー(；´Д｀)");
    }
    return self;
}

// 引数なしでござる〜
-(NSArray *)unkoInfos {
    NSMutableArray *unkos = [[NSMutableArray alloc] init];
    // あーやっとSQLっぽいところまでたどりついたε-(´∀｀*)ﾎｯ
    NSString *query = @"SELECT * FROM unkos ORDER BY uid DESC";
    sqlite3_stmt *statement;
    
    if (sqlite3_prepare_v2(_singletonInstance, [query UTF8String], -1, &statement, nil) != SQLITE_OK) {
        NSLog(@"おおおおおおおおおおsqlite準備できなかったんだけどー");
    } else {
        while(sqlite3_step(statement) == SQLITE_ROW) {
            int uid = sqlite3_column_int(statement, 0);
            char *ownerNameChars = (char *) sqlite3_column_text(statement, 1);
            
            NSString *ownerName = [[NSString alloc] initWithUTF8String:ownerNameChars];
            
            DBTestUnkoInfo *info = [[DBTestUnkoInfo alloc] init:uid ownerName:ownerName];
            
            [unkos addObject:info];
        }
        sqlite3_finalize(statement);
    }
    return unkos;
}

@end
