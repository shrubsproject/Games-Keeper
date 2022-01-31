//
//  resultCell.swift
//  shrubsProject
//
//  Created by Ilya Egorov on 31.01.2022.
//

import UIKit

class ResultCell: UITableViewCell{
    override init(style: UITableViewCell.CellStyle,  reuseIdentifier: String?){
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not implemnted")
    }
}
