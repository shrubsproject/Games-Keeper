//
//  resultViewModel.swift
//  shrubsProject
//
//  Created by Ilya Egorov on 02.01.2022.
//

import Foundation

protocol ResultViewModelCoordin{
    func newGameFromResults()
    func resume()
}

class ResultsViewModel {
    var players: [Player]
    var turns: [Turn]
    let coordin: ResultViewModelCoordin
    
    init(coordin: ResultViewModelCoordin, players: [Player], turns: [Turn]){
        self.coordin = coordin
        self.players = players
        self.turns = turns.reversed()
    }
    
    func newGame(){
        coordin.newGameFromResults()
    }
    
    func resume(){
        coordin.resume()
    }
    
    func scoreRank() -> [(Player, Int)]{
        let players = players.sorted {
            if $0.score > $1.score { return true }
            if $0.score == $1.score, $0.name < $1.name { return true }
            return false
        }
        return Array(zip(players, players.indices.map({$0.advanced(by: 1)})))
    }
}
