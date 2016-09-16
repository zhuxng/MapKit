//
//  ViewController.m
//  MapKit
//
//  Created by 朱星 on 16/9/13.
//  Copyright © 2016年 zhuxing. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()<MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property(nonatomic,strong) CLLocationManager *lM;
@end

@implementation ViewController

- (CLLocationManager *)lM
{
    if (!_lM) {
        _lM = [[CLLocationManager alloc] init];
        if ([_lM respondsToSelector:@selector(requestAlwaysAuthorization)])
        {
            [_lM requestAlwaysAuthorization];
        }
    }
    return _lM;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self lM];
//    self.mapView.userTrackingMode = MKUserTrackingModeFollowWithHeading;
//    self.mapView.hidden = YES;
//    self.mapView.showsTraffic = YES;
//    self.mapView.showsScale = YES;
//    self.mapView.showsCompass = YES;
//    self.mapView.showsBuildings = YES;
    self.mapView.showsUserLocation = YES;
//
}
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    /**
     *  MKUserLocation  大头针模型

     */
    
    userLocation.title = @"朱星";
    userLocation.subtitle = @"nihao";
    
    [self.mapView setCenterCoordinate:userLocation.location.coordinate animated:YES];
    
    MKCoordinateSpan span = MKCoordinateSpanMake(0.001, 0.001);
    MKCoordinateRegion region = MKCoordinateRegionMake(userLocation.location.coordinate, span);
    [self.mapView setRegion:region animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
