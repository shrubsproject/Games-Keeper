//
//  second.swift
//  shrubsProject
//
//  Created by Ilya Egorov on 02.01.2022.
//

import Foundation
import UIKit

class Coordin: dashboardViewModelCordinat, addPlayerViewModelCordinat {
    
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
    
    var  addPlayerVieController: addPlayerViewController{
        let addPlayerViewController = addPlayerViewController()
        let addPlayerViewModel = addPlayerViewModel(coordinat: self)
        addPlayerViewController.viewModel = addPlayerViewModel
        return addPlayerViewController
    }
    
    
    init (window: UIWindow){
        self.window = window
        rootViewController = UINavigationController()
        window.rootViewController = rootViewController
    }
}
