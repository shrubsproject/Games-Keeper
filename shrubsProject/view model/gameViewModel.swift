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
    let coordin: GameViewModelCoordinator
    
    let startTimer: TimeInterval?
    let stopTimer: TimeInterval?
    
    let statusService: statusServis
    var onNewTurn: ((Int)-> Void)?
    
    var currentPlayerIndex: Int {
        willSet{
            turns.append(Turn(player: players[newValue].name, scoreChange: 0))
            onNewTurn?(newValue)
        }
    }
    
    init(players: [Player], coordin: GameViewModelCoordinator, statusService: statusServis) {
        self.players = players
        self.coordin = coordin
        self.currentPlayerIndex = 0
        turns.append(Turn(player: players[0].name, scoreChange: 0))
        
        self.startTimer = nil
        self.stopTimer = nil
        self.statusService = statusService
    }
    
    init(entity: Entity, coordin: GameViewModelCoordinator, statusService: statusServis) {
        self.players = entity.players
        self.coordin = coordin
        self.turns = entity.turns
        self.startTimer = entity.timestamp
        self.stopTimer = entity.stoppedTime
        self.currentPlayerIndex = entity.currentIndex
        self.statusService = statusService
    }
    
    func add(score: Int){
        if score < 0 {
            let absScore = abs(score)
            if absScore <= players[currentPlayerIndex].score{
                players[currentPlayerIndex].score -= absScore
            }
        }else{
            players[currentPlayerIndex].score += score
        }
        turns[turns.count - 1].scoreChange += score
    }
    
    func resetTurn(){
        players[currentPlayerIndex].score -= turns[turns.count - 1].scoreChange
        turns[turns.count - 1].scoreChange = 0
    }
    
    func newGame(){
        coordin.newGame()
    }
    
    func showResults(){
        coordin.showResults(players: players, turns: turns)
    }
    
    func saveParty(timestamp : TimeInterval?, stoppedTime: TimeInterval?){
        statusService.store(entity: Entity(players: players, turns: turns, timestamp: timestamp, stoppedTime: stoppedTime, currentIndex: currentPlayerIndex))
    }
    
    func getTimerRestoreInfo() -> (startTime: TimeInterval?, stopTime: TimeInterval?)?{
        guard startTimer != nil || stopTimer != nil else {return nil}
        return (startTimer, stopTimer)
    }
    
    func clearParty(){
        statusService.clearEnt()
    }
}
