//
//  DBTestViewController.m
//  DBTest
//
//  Created by Hiromu Ochiai on 12/26/13.
//  Copyright (c) 2013 otiai10. All rights reserved.
//

#import "DBTestViewController.h"

// 自作したDBアクセサを使うために必要な.hファイルをimport
#import "DBTestUnkoInfo.h"
#import "DBTestUnkoDatabase.h"

@interface DBTestViewController ()

@end

@implementation DBTestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // 自作DBアクセサのINSERTのラッパーメソッド呼ぶ
    [[DBTestUnkoDatabase myDatabase] addUnkoWithName:@"Unkle John"];
    
    // 自作DBアクセサのSELECTのラッパーメソッドを呼ぶ
    NSArray *unkoInfos = [[DBTestUnkoDatabase myDatabase] unkoInfos];
    for (DBTestUnkoInfo *info in unkoInfos) {
        NSLog(@"\nうんこのユニークID\t%d\tうんこのオーナーさん\t%@", info.uid, info.ownerName);
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
