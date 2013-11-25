//
//  MapViewController.m
//  Pathapp
//
//  Created by Sachin Jindal on 11/19/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import <GoogleMaps/GoogleMaps.h>
#import "MapViewController.h"
#import "legInfo.h"

@interface MapViewController ()

@end


@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:40.7577
                                                            longitude:-73.9857
                                                                 zoom:10];
    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = camera.target;
    marker.snippet = @"Hello World";
    //marker.animated = YES;
    
    
    NSArray *routePathArray  = self.route.path;
    for (int i=0; i<[routePathArray count]; i++){
    GMSMutablePath *routePath = [GMSMutablePath pathFromEncodedPath:routePathArray[i]];
    
 GMSPolyline *polyline = [GMSPolyline polylineWithPath:routePath];
        
        legInfo *currentLeg = ((legInfo*)self.route.legs[i]);
        
        NSString *hexColor = currentLeg.legColor;
        NSUInteger red, green, blue;
        sscanf([hexColor UTF8String], "#%02X%02X%02X", &red, &green, &blue);
        UIColor *color = [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1];
        polyline.strokeColor = color;
    polyline.strokeWidth = 5.f;
    polyline.map = mapView;
        
    }
    self.view = mapView;

}

@end

