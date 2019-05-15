//
//  ViewController.swift
//  lighthousepe_sdk_v2_test
//
//  Created by Erik Madsen on 5/15/19.
//  Copyright © 2019 Erik Madsen. All rights reserved.
//

import UIKit
import CoreLocation
import LighthouseKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        locationManager.delegate = self
        
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            // Request when-in-use authorization initially
            // locationManager.requestWhenInUseAuthorization()
            locationManager.requestAlwaysAuthorization()
            break
            
        case .restricted, .denied:
            // Disable location features
            //disableMyLocationBasedFeatures()
            break
            
        case .authorizedWhenInUse:
            // Enable basic location features
            //enableMyWhenInUseFeatures()
            break
            
        case .authorizedAlways:
            // Enable any of your app's location features
            //enableMyAlwaysFeatures()
            Lighthouse.setAllowsLocation(true) { (success: Bool, error: Error?) in
                print("Updated LHPE allows location")
            }
            break
        }
        
    }

}

