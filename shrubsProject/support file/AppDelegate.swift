//
//  AppDelegate.swift
//  shrubsProject
//
//  Created by Ilya Egorov on 02.01.2022.
//

import UIKit

@main

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordin: Coordin!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        setup()
        
        let coordin = Coordin(window: window)
        coordin.start()
        
        window.makeKeyAndVisible()
        return true
    }
    
    func setup(){
        let navigationBarAppearence = UINavigationBar.appearance()
        navigationBarAppearence.largeTitleTextAttributes = [.font: UIFont(name: "Charter", size: 36)!, .foregroundColor: UIColor.white]
        navigationBarAppearence.barTintColor = UIColor.white
        navigationBarAppearence.backgroundColor = UIColor(named: "Color-3")
        navigationBarAppearence.setBackgroundImage(UIImage(), for: .default)
        navigationBarAppearence.shadowImage = UIImage()
        
        let barButtonItemAppearence = UIBarButtonItem.appearance()
        barButtonItemAppearence.setTitleTextAttributes([.font: UIFont(name: "Charter", size: 17)!, .foregroundColor: UIColor(named: "Color")!], for: .normal)
        barButtonItemAppearence.setTitleTextAttributes([.font: UIFont(name: "Charter", size: 17)!, .foregroundColor: UIColor(named: "Color")!], for: .highlighted)
    }

}
