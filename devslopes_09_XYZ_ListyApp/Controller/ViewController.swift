//
//  ViewController.swift
//  devslopes_09_XYZ_ListyApp
//
//  Created by Mac PC on 5/4/20.
//  Copyright © 2020 Ticon. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    @IBOutlet weak var xLbl: UILabel!
    @IBOutlet weak var yLbl: UILabel!
    @IBOutlet weak var zLbl: UILabel!
    
    var motionManager: CMMotionManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        motionManager = CMMotionManager()
        
        motionManager.startAccelerometerUpdates(to: .main, withHandler: updateLabels)
    }
    
    func updateLabels(data: CMAccelerometerData?, error:Error?) {
        guard let acclerometerData = data else { return }
        //print(acclerometerData)
        
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = 1
        numberFormatter.maximumFractionDigits = 1
        
        let x = numberFormatter.string(for: acclerometerData.acceleration.x)!
        let y = numberFormatter.string(for: acclerometerData.acceleration.y)!
        let z = numberFormatter.string(for: acclerometerData.acceleration.z)!
        print(x,y,z)
        
        xLbl.text = "X: \(x)"
        yLbl.text = "Y \(y)"
        zLbl.text = "Z \(z)"
        
        
    }
    
    
    

}

