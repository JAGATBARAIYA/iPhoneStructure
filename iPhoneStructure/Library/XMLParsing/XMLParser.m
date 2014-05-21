//
//  XMLParser.m
//  StrongBox
//
//  Created by _MyCompanyName_ on 17/04/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "XMLParser.h"
#import "TouchXML.h"

@implementation XMLParser

/*
-(NSString*)getLoginInformation:(NSString *)xmlData :(id)parent
{
	appDelegate = [[UIApplication sharedApplication]delegate];
	
	NSError *theError = NULL;
	CXMLDocument *theXMLDocument = [[[CXMLDocument alloc] initWithXMLString:xmlData options:0 error:&theError] autorelease];
	
	CXMLElement *rootElement = [theXMLDocument rootElement];	
	NSArray *nsarrUserDetails = [rootElement children];

	if([nsarrUserDetails count]==1)
	{
		CXMLElement *loc = [nsarrUserDetails objectAtIndex:0];
		NSString *nodeValue = [loc stringValue];
		return nodeValue;
	}
	
	for(CXMLElement *loc in nsarrUserDetails)
	{		
		NSString *nodeName = [loc name];                
		NSString *nodeValue = [loc stringValue];

		if ([nodeName isEqualToString:@"UserID"]) 
			appDelegate.objUserInformation.intUserID = [nodeValue intValue];
		
		if([nodeName isEqualToString:@"Name"])
			appDelegate.objUserInformation.strUserName =nodeValue;		
		
		if ([nodeName isEqualToString:@"UserEmail"]) 
			appDelegate.objUserInformation.strUserEmail = nodeValue;		

		if ([nodeName isEqualToString:@"Password"]) 
			appDelegate.objUserInformation.strPassword = nodeValue;		

		if ([nodeName isEqualToString:@"ContactNo"]) 
			appDelegate.objUserInformation.strContactNO = nodeValue;		
	}
	
	return @"success";
}
*/

@end
