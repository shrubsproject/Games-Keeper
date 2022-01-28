//
//  gameViewModel.swift
//  shrubsProject
//
//  Created by Ilya Egorov on 02.01.2022.
//

import Foundation
protocol GameViewModelCoordinator {
    func showResults(players: [Player], turns: [Turn])
    func newGame()
}

class GameViewModel {
    
    var players: [Player]
    var turns: [Turn] = .init()
    let coordinator: GameViewModelCoordinator
    
    let startTime: TimeInterval?
    let stopTime: TimeInterval?
    
    let statusService: statusServis
    var onNewTurn: ((Int)-> Void)?
    
    var currentPlayerIndex: Int {
        willSet{
            turns.append(Turn(player: players[newValue].name, scoreChange: 0))
            onNewTurn?(newValue)
        }
    }
    
    init(players: [Player], coordinator: GameViewModelCoordinator, statusService: statusServis) {
        self.players = players
        self.coordinator = coordinator
        self.currentPlayerIndex = 0
        turns.append(Turn(player: players[0].name, scoreChange: 0))
        
        self.startTime = nil
        self.stopTime = nil
        self.statusService = statusService
    }
    
}
