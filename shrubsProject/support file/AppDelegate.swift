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
        navigationBarAppearence.largeTitleTextAttributes = [.font: UIFont(name: "Zapf Dignats", size: 30)!, .foregroundColor: UIColor.white]
        navigationBarAppearence.barTintColor = UIColor.green
        navigationBarAppearence.backgroundColor = UIColor.gray
        navigationBarAppearence.setBackgroundImage(UIImage(), for: .default)
        navigationBarAppearence.shadowImage = UIImage()
        
        let barButtonItemAppearence = UIBarButtonItem.appearance()
        barButtonItemAppearence.setTitleTextAttributes([.font: UIFont(name: "Zapf Dignbats", size: 30)!, .foregroundColor: UIColor.blue], for: .normal)
        barButtonItemAppearence.setTitleTextAttributes([.font: UIFont(name: "Zapf Dignbats", size: 30)!, .foregroundColor: UIColor.white], for: .highlighted)
        barButtonItemAppearence.setTitleTextAttributes([.font: UIFont(name: "Zapf Dignbats", size: 30)!], for: .disabled)
    }

}
