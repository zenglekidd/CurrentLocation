//
//  ViewController.m
//  CurrentLocation
//
//  Created by Le Zeng on 9/5/14.
//  Copyright (c) 2014 Le Zeng. All rights reserved.
//

#import "ViewController.h"
@import CoreLocation;

@interface ViewController () <CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    CLLocation *currentLocation;
}
@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
}

#pragma mark CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    currentLocation = [locations lastObject];
    
    self.latitudeLabel.text = [NSString stringWithFormat:@"Latidude: %0.6f", currentLocation.coordinate.latitude];
    self.longitudeLabel.text = [NSString stringWithFormat:@"Longitude: %.6f", currentLocation.coordinate.longitude];
}

@end
