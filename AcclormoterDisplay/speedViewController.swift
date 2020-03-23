//
//  speedViewController.swift
//  AcclormoterDisplay
//
//  Created by Mark Falcone on 3/19/20.
//  Copyright © 2020 GroupAlert. All rights reserved.
//

import UIKit
import MapKit
import CoreMotion
import CoreLocation

class speedViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var speedDisplay: UITextField!
    
    let manager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.stopUpdatingLocation()


    }
 func locationManager(manager: CLLocationManager, didUpdateLocations locations:[CLLocation]) {
     let location = locations[0]
    self.speedDisplay.text! = String(location.speed)
    
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
