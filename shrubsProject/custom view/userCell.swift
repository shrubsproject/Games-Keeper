//
//  userCell.swift
//  shrubsProject
//
//  Created by Ilya Egorov on 06.01.2022.
//

import Foundation
import UIKit

class userCell: UITableViewCell {
    enum Style{
        case user
        case add
    }
    static let id = "privetID"
    
    var handler: (() -> (Void))?
    var style: userCell.Style = .user
}
