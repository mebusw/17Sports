//
//  MerchantMapViewController.m
//  17sports
//
//  Created by mebusw on 13-6-27.
//  Copyright (c) 2013年 mebusw. All rights reserved.
//

#import "MerchantMapViewController.h"
#import "Anno.h"
@interface MerchantMapViewController ()

@end

@implementation MerchantMapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    DLog(@"");
    
    [self.map setShowsUserLocation:YES];
    
    DLog(@"locating is %d, auth status=%d", [CLLocationManager locationServicesEnabled],  [CLLocationManager authorizationStatus]);

    MKCoordinateSpan theSpan;    //地图的范围 越小越精确
    theSpan.latitudeDelta = .2;
    theSpan.longitudeDelta = .2;
    
    MKCoordinateRegion theRegion;
    theRegion.center = [self.map userLocation].coordinate;
    theRegion.span = theSpan;
    [self.map setRegion:theRegion];
    [self.map setCenterCoordinate:theRegion.center animated:YES];
    NSLog(@"here=%f, %f", theRegion.center.latitude, theRegion.center.longitude);
    
    [self addAnnos];
}

-(void) addAnnos {
    NSArray *merchants = [NSMutableArray arrayWithArray:@[
                          @{@"id": @"1", @"name": @"复康路游泳馆", @"latitude": @39.099142, @"longitude": @117.171809},
                          @{@"id": @"4", @"name": @"三源益康", @"latitude": @39.1273, @"longitude": @117.2503},
                          @{@"id": @"3", @"name": @"游泳跳水馆", @"latitude": @39.1099, @"longitude": @117.2554}
                          ]];
    
    NSDictionary *merchant = merchants[0];
    Anno *anno = [[Anno alloc] init];
    NSNumber *lng = ((NSNumber*)merchant[@"longitude"]);
    NSNumber *lat = ((NSNumber*)merchant[@"latitude"]);
    
    anno.coordinate = CLLocationCoordinate2DMake([lat floatValue], [lng floatValue]);
    anno.title = merchant[@"name"];
    anno.subtitle = @"距离1.2km";
    
    [self.map addAnnotation:anno];
    
}


@end
