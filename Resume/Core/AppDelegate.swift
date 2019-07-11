//
//  AppDelegate.swift
//  Resume
//
//  Created by Abdullah Tabassum on 2019-07-09.
//  Copyright © 2019 Abdullah Tabassum. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let resumeCoord: ResumeCoordinatorImpl = ResumeCoordinatorImpl()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        resumeCoord.start(window: window!)
        window!.makeKeyAndVisible()
        
        return true
    }

}

