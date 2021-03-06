//
//  MerchantData.h
//  17sports
//
//  Created by mebusw on 13-8-19.
//  Copyright (c) 2013年 mebusw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MerchantData : NSObject

+(NSArray*) allMerchants;
+(NSArray*) allMerchantsOfGolf;
+(NSArray*) allMerchantsOfEquestrianism;
+(NSArray*) allMerchantsOfSwimming;
+(NSArray*) allMerchantsOfBodyBuilding;
+(NSArray*) allMerchantsOfBilliards;
+(NSArray*) allMerchantsOfTennis;


+(NSArray*) filterMerchants:(NSArray*)merchants byName:(NSString*)name;


@end
