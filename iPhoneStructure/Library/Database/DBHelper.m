//
//  DBHelper.m
//  BasicStructure
//
//  Created by _MyCompanyName_ on 14/02/11.
//  Copyright 2011 _MyCompanyName_. All rights reserved.
//

#import <CoreLocation/CLLocation.h>
#import "DBHelper.h"

#define kDatabaseName @"Database.sqlite"

static sqlite3_stmt *updateStmt = nil;
static DBHelper *singletonInstance = nil;

@implementation DBHelper

#pragma mark instance methods called once

+(DBHelper*)sharedInstance{
    if(singletonInstance == nil)
        singletonInstance = [[super allocWithZone:NULL] init];
    
    return singletonInstance;
}

-(id) init {
    if(self = [super init]){
        //Check and Create Database in Iphone if not exists
        [self checkAndCreateDatabase];
    }
	return self;
}

-(void)checkAndCreateDatabase {	
	NSString *databasePath = [Helper getDocumentDirectoryPath:kDatabaseName];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	
	if(![fileManager fileExistsAtPath:databasePath]){
		NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:kDatabaseName];
        NSError *error;
		[fileManager copyItemAtPath:databasePathFromApp toPath:databasePath error:&error];

        if(error)
            NSLog(@"Error->%@",[error localizedDescription]);
	}

	//Open DB Connection
	if(sqlite3_open([databasePath UTF8String], &_database) != SQLITE_OK)
		sqlite3_close(_database);
    else
        [self enableCascadeOption];

    [FCModel openDatabaseAtPath:databasePath withSchemaBuilder:^(FMDatabase *db, int *schemaVersion) {
        [db setCrashOnErrors:YES];
        db.traceExecution = YES;
        [db beginTransaction];
        [db commit];
    }];

	return;
}

-(void)enableCascadeOption{
 	const char *updateSql;

	updateSql = nil;
	if(updateStmt == nil)
	{
		updateSql = "PRAGMA foreign_keys = ON";
		if(sqlite3_prepare_v2(_database, updateSql, -1, &updateStmt, NULL) != SQLITE_OK)
			NSAssert1(0, @"Error while creating insert statement. '%s'", sqlite3_errmsg(_database));
	}
	//Insert the values into DB
	if(SQLITE_DONE != sqlite3_step(updateStmt))
	{
		NSAssert1(0, @"Error while inserting data. '%s'", sqlite3_errmsg(_database));
	}

	//Reset the add statement.
	sqlite3_reset(updateStmt);
	updateStmt = nil;
}

#pragma mark - Get all Txt Safes

/*
-(void)allDetails:(NSMutableArray *)allValues{
    [allValues removeAllObjects];

    FMDatabase *db = [FMDatabase databaseWithPath:[Helper getDocumentDirectoryPath:kDatabaseName]];
    [db open];

    FMResultSet *s = [db executeQuery:@"SELECT * from TABLENAME"];
    while([s next]){
        Data *data = [Data new];
        data.value =    [s intForColumn:@"ColumnName"];
        data.value =    [s stringForColumn:@"ColumnName"];
        [arrSafes addObject:data];
    }
    [db close];
}
*/

@end
