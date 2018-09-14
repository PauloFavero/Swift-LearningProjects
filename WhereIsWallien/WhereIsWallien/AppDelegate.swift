//
//  AppDelegate.swift
//  WhereIsWallien
//
//  Created by Gustavo Lima on 26/04/2017.
//  Copyright © 2017 Instituto de Pesquisas Eldorado. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        if launchedBefore  {
            print("Not first launch.")
        } else {
            print("First launch")
            UserDefaults.standard.set(true, forKey: "launchedBefore")
            
            let mainStoryBoard = UIStoryboard(name:"Main", bundle: nil)
            let tutorial = mainStoryBoard.instantiateViewController(withIdentifier: "Tutorial")
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.rootViewController = tutorial
            self.window?.makeKeyAndVisible()
              
            
            
        }

        return true
    }

}

