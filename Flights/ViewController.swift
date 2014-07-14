//
//  ViewController.swift
//  Flights
//
//  Created by David Mazza on 7/12/14.
//  Copyright (c) 2014 Peaking Software LLC. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    var steps = 0
    var stairs = 1
                            
    @IBOutlet strong var scoreLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Core Motion testing:
        
        //var motion: CMAltimeter = CMAltimeter()
        var accelerometer: CMMotionManager = CMMotionManager()
        
        println("hello")
        
        //if(CMMotion.gy)
        
        accelerometer.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue()) {
            (accelerometerData, error) in println("acc")
        }
        accelerometer.startGyroUpdatesToQueue(NSOperationQueue.currentQueue(), withHandler: (gyroData, error) {
            println("hello gyro")
            })
        //motion.startRelativeAltitudeUpdatesToQueue(NSOperationQueue.currentQueue()) {
        //    altitudeData in println("\(altitudeData.0.relativeAltitude)")
        //    println("in motion")
        //}
        
        scoreLabel!.text = "\(steps)"
        let timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("incrementSteps"), userInfo: nil, repeats: true)
        timer.fire()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func incrementSteps() {
        steps++
        scoreLabel!.text = "\(steps)"
        
    }
}

