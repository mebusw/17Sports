//
//  WelcomeViewController.m
//  17sports
//
//  Created by mebusw on 13-6-27.
//  Copyright (c) 2013年 mebusw. All rights reserved.
//

#import "WelcomeViewController.h"
#import "MainViewController.h"
#import "DetailViewController.h"
#import <MapKit/MapKit.h>
#import "SwipeVC.h"
#import "MerchantData.h"

@interface WelcomeViewController () {
    NSArray *imagesOfMerchant;
}
@end

@implementation WelcomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    SwipeVC *swipeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SwipeVC"];
    [self addChildViewController:swipeVC];
    [self.containerView addSubview:swipeVC.view];
    swipeVC.delegate = (id)self;
    swipeVC.images = @[@"recommends.jpg", @"100.jpg", @"80.jpg"];
    
    ((UIScrollView*)(self.view)).contentSize = CGSizeMake(320, 460);
}

-(void) viewWillAppear:(BOOL)animated {
    self.view.frame = self.parentViewController.view.bounds;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)shortcuts:(id)sender {
    int tag = ((UIButton*)sender).tag;
    DLog(@"tag=%d", tag);
    MainViewController* mainVC = (MainViewController*)self.parentViewController;
    switch (tag) {
        case SWIMMING:
            mainVC.merchants = [MerchantData allMerchantsOfSwimming];
            [(MainViewController*)self.parentViewController switchToList];
            break;
        case EQUESTRIANISM:
            mainVC.merchants = [MerchantData allMerchantsOfEquestrianism];
            [(MainViewController*)self.parentViewController switchToList];
            break;
        case GOLF:
            mainVC.merchants = [MerchantData allMerchantsOfGolf];
            [(MainViewController*)self.parentViewController switchToList];
            break;
        case BODYBUILDING:
            mainVC.merchants = [MerchantData allMerchantsOfBodyBuilding];
            [(MainViewController*)self.parentViewController switchToList];
            break;
        case BILLIARDS:
            mainVC.merchants = [MerchantData allMerchantsOfBilliards];
            [(MainViewController*)self.parentViewController switchToList];
            break;
        case TENNIS:
            mainVC.merchants = [MerchantData allMerchantsOfTennis];
            [(MainViewController*)self.parentViewController switchToList];
            break;
        default:
            break;
    }
}

-(void)onClick:(int)currentPage {
    DLog(@"tag=%d", currentPage);

    DetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    [self.parentViewController.navigationController pushViewController:detailVC animated:YES];
}


@end
