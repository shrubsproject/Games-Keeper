//
//  dashboardViewController.swift
//  shrubsProject
//
//  Created by Ilya Egorov on 02.01.2022.
//

import Foundation

protocol dashboardViewModelCordinat {
    
    func startGame(with players: [Player])
//    func addPlayer(handler: )
}
class dashboardViewModel {
    
    var players: [Player] = .init()
    let coordinat: dashboardViewModelCordinat
    
    var onPlayerDelete: ((Int) -> Void)?
    var onPlayerAdd: (() -> Void)?
    
    func addPlayer(){
        coordinat.
    }
    
    func startGame(){
        coordinat.startGame(with: players)
    }
    
    func deletePlayer(){
        
    }
    
}
