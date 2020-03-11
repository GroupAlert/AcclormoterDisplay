//
//  ViewController.swift
//  AcclormoterDisplay
//
//  Created by Mark Falcone on 3/9/20.
//  Copyright © 2020 GroupAlert. All rights reserved.
//

import UIKit
import CoreMotion

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
        
        // Do any additional setup after loading the view.
    }
    // this can also go in a viewDidApear to start the tracking as soon as the app is shown
    func testAccelerometers() {
        print("in start accc")
//        motionManager.accelerometerUpdateInterval = 0.5
//        motionManager.startAccelerometerUpdates()
        // Make sure the accelerometer hardware is available.
        if self.motionManager.isAccelerometerAvailable {
            self.motionManager.accelerometerUpdateInterval = 2//1.0 / 60.0  // 60 Hz
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

