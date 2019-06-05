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

    @IBAction func setProfile(_ sender: Any) {
        
        // Create/Update Lighthouse User with unique user identifier
        if let lhUser : LHUser = LHUser.initWithExternalId("ABC123") {
            
            // Populate User Profile
            let profile:NSMutableDictionary = NSMutableDictionary()
            profile.setValue("Edmond", forKey: "first_name")
            profile.setValue("Dantes", forKey: "last_name")
            profile.setValue("count@montecristo.com", forKey: "email")
            
            do {
                
                // Serialize data as JSON
                let profileData = try JSONSerialization.data(withJSONObject: profile, options: JSONSerialization.WritingOptions())
                lhUser.profile = profileData
                lhUser.saveInBackground({ (success, error) -> Void in
                    print("User Saved")
                })
                
            } catch let parseError as NSError {
                print(parseError)
                
            }
            
        }

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        locationManager.delegate = self
        
        // Evaluate state of permissions, report to LHPE and request permissions when appropriate
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            // Request when-in-use authorization initially
            locationManager.requestAlwaysAuthorization()
            break
            
        case .restricted, .denied:
            // Disable location features
            //disableMyLocationBasedFeatures()
            Lighthouse.setAllowsLocation(false) { (success: Bool, error: Error?) in
                print("Updated LHPE allows location")
            }
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

