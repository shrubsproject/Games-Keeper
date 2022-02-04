//
//  carouselCell.swift
//  shrubsProject
//
//  Created by Ilya Egorov on 28.01.2022.
//

import UIKit

class carouselCell: UICollectionViewCell{
    
    static let id = "carouselID"
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Charter", size: 40)
        label.textColor = UIColor(named: "Color-2")
        return label
    }()
    
    let scoreLabel: UILabel = {
        
        let label  = UILabel()
        label.font = UIFont(name: "Charter", size: 100)
        label.textColor = UIColor(red: 1, green: 0.99, blue: 0.99, alpha: 1.0)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "Color-1")
        layer.cornerRadius = 25.0
        contentView.addSubview(nameLabel)
        contentView.addSubview(scoreLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: contentView.frame.height/7),
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            scoreLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            scoreLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
