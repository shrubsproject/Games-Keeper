//
//  ent.swift
//  shrubsProject
//
//  Created by Ilya Egorov on 06.01.2022.
//

import Foundation

struct Entity: Codable {
    
    let players: [Player]
    let turns: [Turn]
    let timestamp: TimeInterval?
    let stoppedTime: TimeInterval?
    let currentIndex: Int
}
