//
//  player.swift
//  shrubsProject
//
//  Created by Ilya Egorov on 06.01.2022.
//

import Foundation

struct Player: Codable {
    
    var score: Int = 0
    let name: String
    
    init(name: String){
        self.name = name
    }
}
