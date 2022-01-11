//
//  dashboardViewController.swift
//  shrubsProject
//
//  Created by Ilya Egorov on 02.01.2022.
//

import Foundation

protocol dashboardViewModelCordinat {
    
    func startGame(with players: [Player])
    func addPlayer(handler: @escaping ((String) -> Bool))
}
class dashboardViewModel {
    
    var players: [Player] = .init()
    let coordinat: dashboardViewModelCordinat
    
    var onPlayerDelete: ((Int) -> Void)?
    var onPlayerAdd: (() -> Void)?
    
    func addPlayer(){
        coordinat.addPlayer {[unowned self] name in
            if self.players.contains(where: {$0.name == name})
            {
                return false
            }else {
                self.players.append(Player(name: name))
                self.onPlayerAdd?()
                return true
            }
        }
    }
    
    func startGame(){
        coordinat.startGame(with: players)
    }
    
    func deletePlayer(at index: Int){
        players.remove(at: index)
        onPlayerDelete?(index)
    }
    
    func copitsl(){
        loh ya
    }
    
    init(coordinat: dashboardViewModelCordinat){
        self.coordinat = coordinat
    }
    
}
