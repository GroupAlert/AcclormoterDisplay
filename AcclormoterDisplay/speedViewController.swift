//
//  speedViewController.swift
//  AcclormoterDisplay
//
//  Created by Mark Falcone on 3/19/20.
//  Copyright © 2020 GroupAlert. All rights reserved.
//
// TODO create a noticaction class
import UIKit
import MapKit
import CoreMotion
import CoreLocation
import UserNotifications

class speedViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var speedDisplay: UITextField!
    let manager = CLLocationManager()
    let notificationController = UNMutableNotificationContent()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
        
        
        
    }
    func locationManager(manager: CLLocationManager, didUpdateLocations locations:[CLLocation]) {
        let location = locations[0]
        var speed = location.speed
        self.speedDisplay.text! = String(location.speed)
        if speed > 10{
            notificationController.body = "slow down you are going  \(speed)"
        }
        
        
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
