//
//  Distance.m
//  17sports
//
//  Created by mebusw on 13-8-19.
//  Copyright (c) 2013年 mebusw. All rights reserved.
//

#import "Distance.h"
#import <MapKit/MapKit.h>

@implementation Distance

+(NSArray*) sortMerchantsByDistance:(NSArray*)merchants myCoord:(CLLocationCoordinate2D)myCoord {
    return [merchants sortedArrayUsingComparator: ^(NSMutableDictionary* obj1, NSMutableDictionary* obj2) {
        CLLocationCoordinate2D coord1 = CLLocationCoordinate2DMake([obj1[@"latitude"] doubleValue], [obj1[@"longitude"] doubleValue]);
        double dist1 = [Distance calculateDistanceOfCoord1:myCoord Coord2:coord1];
//        obj1[@"caculatedDistance"] = [NSNumber numberWithDouble:dist1];
        
        CLLocationCoordinate2D coord2 = CLLocationCoordinate2DMake([obj2[@"latitude"] doubleValue], [obj2[@"longitude"] doubleValue]);
        double dist2 = [Distance calculateDistanceOfCoord1:myCoord Coord2:coord2];
//        obj2[@"caculatedDistance"] = [NSNumber numberWithDouble:dist2];
        
        if (dist1 > dist2) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        
        if (dist1 < dist2) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
}

+(double) calculateDistanceOfCoord1:(CLLocationCoordinate2D)coord1 Coord2:(CLLocationCoordinate2D)coord2{  
    const double EARTH_RADIUS = 6378.137;
    double radLat1 = [self rad:coord1.latitude];
    double radLat2 = [self rad:coord2.latitude];
    
    double a = radLat1 - radLat2;
    double b = [self rad:coord1.longitude] - [self rad:coord2.longitude];
    
    double s = 2 * asin( sqrt( pow(sin(a / 2), 2) + cos(radLat1) * cos(radLat2) * pow(sin(b / 2), 2) ) );
    s *= EARTH_RADIUS;
    s = round(s * 10000) / 10000;
    
    return s;
}

+(double) rad:(double)d {
    const double PI = 3.141592653589793;
    return d * PI / 180.0;
}

@end


