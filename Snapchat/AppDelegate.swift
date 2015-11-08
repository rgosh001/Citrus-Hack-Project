//
//  Citrus
//
//  Created by Rashid Goshtasbi on 11/7/15.
//  Copyright © 2015 Developers Academy. All rights reserved.
//

import UIKit

import Parse
import Bolts


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        
        // Initialize Parse.
        Parse.setApplicationId("iRo2ir75K52ZZXYpUX3JL0DLbzeVBXUGnp0mjQnA", clientKey: "oOp7BIWmYbq5tcBZgAmjwS558s61g3SVvwq3fXkk")
        
        let testObject = PFObject(className: "TestCLass")
        testObject["TestProperty"] = "value1"
        testObject.saveInBackgroundWithBlock{ (success, error) -> Void in
            if error == nil {
                print("successfully saved the objet")
            }
        }
        
        
        
        customizeAppearance()
        
        return true
    }
    
    func customizeAppearance() {
        let tintColor = UIColor(red: 255/255, green: 45/255, blue: 85/255, alpha: 1)
        window!.tintColor = tintColor
    }


}













