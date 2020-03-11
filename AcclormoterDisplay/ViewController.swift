//
//  ViewController.swift
//  AcclormoterDisplay
//
//  Created by Mark Falcone on 3/9/20.
//  Copyright © 2020 GroupAlert. All rights reserved.
//

import UIKit
import CoreMotion
import UserNotifications

class ViewController: UIViewController {
    
    
    @IBOutlet weak var xValueField: UITextField!
    @IBOutlet weak var yValField: UITextField!
    @IBOutlet weak var zValField: UITextField!
    @IBOutlet weak var xGyroField: UITextField!
    @IBOutlet weak var yGyroField: UITextField!
    @IBOutlet weak var zGyroField: UITextField!
    
    var motionManager = CMMotionManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testAccelerometers()
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in
          // can do things in here if user did or didnt allow notificatins
        })
        
        
    }
    // this can also go in a viewDidApear to start the tracking as soon as the app is shown
    func testAccelerometers() {
        print("in start accc")
//        motionManager.accelerometerUpdateInterval = 0.5
//        motionManager.startAccelerometerUpdates()
        // Make sure the accelerometer hardware is available.
        
        // set up the notification controller
        let notificationController = UNMutableNotificationContent()
        notificationController.title = "Accident Alert"
        notificationController.subtitle = "sudden accelration"
        notificationController.badge = 1
        notificationController.body = "we detected a rapid change in motion"
        let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        let request = UNNotificationRequest(identifier: "largeAcc", content: notificationController, trigger: notificationTrigger)
        //UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        
        if self.motionManager.isAccelerometerAvailable {
            self.motionManager.accelerometerUpdateInterval = 1.0 / 60.0  // 60 Hz
            self.motionManager.startAccelerometerUpdates(to: OperationQueue.current! ){(data, error) in
            
                print(data as Any)
                // Get the accelerometer data.
                if let myData = self.motionManager.accelerometerData{
                    
                    print("accloromiter Data: \(myData)")
                    let x = myData.acceleration.x
                    let y = myData.acceleration.y
                    let z = myData.acceleration.z
                    
                    // Use the accelerometer data in your app.
                    self.xValueField!.text = String(x)
                    self.yValField!.text = String(y)
                    self.zValField!.text = String(z)
                    if myData.acceleration.x >= 5 || myData.acceleration.y >= 5 ||
                        myData.acceleration.z >= 5{
                        print("large acclrition" )
                        // send notification
                        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)

                        
                    }
                    
                    //self.stopDeviceMotionUpdates())
                    
                }
            }
        }
    }
    
    func startGyros() {
        if motionManager.isGyroAvailable {
            self.motionManager.gyroUpdateInterval = 1.0 / 60.0
            self.motionManager.startGyroUpdates()
            if let data = self.motionManager.gyroData {
                let xGyroData = data.rotationRate.x
                let yGyroData = data.rotationRate.y
                let zGyroData = data.rotationRate.z
                //print to device
                self.xGyroField!.text = String(xGyroData)
                self.yGyroField.text = String(yGyroData)
                self.zGyroField!.text = String(zGyroData)
                //self.stopDeviceMotionUpdates())
            }
        }
        
    }

}

