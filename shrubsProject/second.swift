//
//  second.swift
//  shrubsProject
//
//  Created by Ilya Egorov on 02.01.2022.
//

import Foundation
import UIKit

class Coordin: dashboardViewModelCordinat {
    
    func addPlayer(handler: @escaping ((String) -> Bool)) {
        
    }
    
    enum State{
        case initial
        case games
        case 1
    }
    
    let window: UIWindow
    let rootViewController: UINavigationController
    var modelNavigationViewController: UINavigationController?
    
    var state: Coordin.State = .initial
    
    var dashboardViewController: dashboardViewController{
        let dashboardViewController = shrubsProject.dashboardViewController()
        let dashboardViewModel = dashboardViewModel(coordinat: self)
        dashboardViewController.viewModel = dashboardViewModel
        return dashboardViewController
    }
    
    init (window: UIWindow){
        self.window = window
        rootViewController = UINavigationController()
        window.rootViewController = rootViewController
    }
}
