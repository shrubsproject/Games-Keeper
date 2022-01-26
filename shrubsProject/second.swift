//
//  second.swift
//  shrubsProject
//
//  Created by Ilya Egorov on 02.01.2022.
//

import Foundation
import UIKit

class Coordin {
    
    enum State{
        case initial
        case games
    }
    
    let window: UIWindow
    let rootViewController: UINavigationController
    var modelNavigationViewController: UINavigationController?
    
    var state: Coordin.State = .initial
    
    let statusService = statusServis(key: "Party")
    
//    func start(){
//        if let entity = statusService.loadEnt() {
//            let GameViewController = self.gameViewController
//            let GameViewModel = GameViewModel(
//        }
//    }
    
    var dashboardViewController: dashboardViewController{
        let dashboardViewController = shrubsProject.dashboardViewController()
        let dashboardViewModel = dashboardViewModel(coordinat: self)
        dashboardViewController.viewModel = dashboardViewModel
        return dashboardViewController
    }
    
    var  AddPlayerViewController: addPlayerViewController{
        let AddPlayerViewController = addPlayerViewController()
        let AddPlayerViewModel = addPlayerViewModel(coordinat: self)
        AddPlayerViewController.viewModel = AddPlayerViewModel
        return AddPlayerViewController
    }
    
    var GameViewController: gameViewController{
        let GameViewController = gameViewController()
        return GameViewController
    }
    
    init (window: UIWindow){
        self.window = window
        rootViewController = UINavigationController()
        window.rootViewController = rootViewController
    }
}

extension Coordin: dashboardViewModelCordinat{
    func startGame(with players: [Player]) {
        <#code#>
    }
    
    
    
    func addPlayer(handler: @escaping ((String) -> Bool)) {
        let AddPlayerViewController = self.AddPlayerViewController
        AddPlayerViewController.viewModel.onPlayerAdd = handler
        if let modelNavigationController = modelNavigationViewController{
            modelNavigationController.pushViewController(AddPlayerViewController, animated: true)
        }else{
            rootViewController.pushViewController(AddPlayerViewController, animated: true)
        }
    }
}

extension Coordin: addPlayerViewModelCordinat{
    func dismiss() {
        if let modelNavigationController = modelNavigationViewController {
            modelNavigationController.popViewController(animated: true)
        }else{
            rootViewController.popViewController(animated: true)
        }
    }
}
