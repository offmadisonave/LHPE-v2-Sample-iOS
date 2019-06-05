//
//  AppDelegate.swift
//  lighthousepe_sdk_v2_test
//
//  Created by Erik Madsen on 5/15/19.
//  Copyright © 2019 Erik Madsen. All rights reserved.
//

import UIKit
import LighthouseKit
import EstimoteProximitySDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var proximityObserver: ProximityObserver!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Initialize Estimote Proximity Observer
        let cloudCredentials = CloudCredentials(appID: "sample-code-app-2hl", appToken: "371cf8655dbbc99a232726ac3df85401")
        
        self.proximityObserver = ProximityObserver(
            credentials: cloudCredentials,
            onError: { error in
                print("proximity observer error: \(error)")
        })
        
        // Initialize LHPE
        Lighthouse.setApplicationId("e9db5054-c275-4b55-9c0d-2e8fdcc57a15", clientKey: "d0801a6e-856c-4732-b0ab-eb0f1a645bfb", environment: LHEnvironmentStaging) {
            (success: Bool, error: Error?) in
            
            // Create Proximity Zones
            if(success){
                self.startBeaconing()
            }
            
        }
        
        return true
    }
    
    func startBeaconing() {
        Lighthouse.getBeaconProximityZones({
            (zones: [LHBeaconProximityZone]?, error: Error?) in
            
            self.proximityObserver.stopObservingZones()
            
            var pzones = [ProximityZone]()
            
            for pz in zones! {
                
                let zone = ProximityZone(tag: pz.tag, range: ProximityRange(desiredMeanTriggerDistance: pz.range.doubleValue)!)
                zone.onEnter = { context in
                    Lighthouse.trackBeaconProximityZoneEntry(forProximityTag: context.tag)
                }
                zone.onExit = { context in
                    Lighthouse.trackBeaconProximityZoneExit(forProximityTag: context.tag)
                }
                
                pzones.append(zone)
                
            }
            
            self.proximityObserver.startObserving(pzones)
            
        })
    }

    func applicationWillResignActive(_ application: UIApplication) {
        Lighthouse.applicationWillResignActive()
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        Lighthouse.applicationDidEnterBackground()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        Lighthouse.applicationWillEnterForeground()
        // beacon config may have changed, rebuild
        startBeaconing()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        Lighthouse.applicationDidBecomeActive()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        Lighthouse.applicationWillTerminate()
    }


}

