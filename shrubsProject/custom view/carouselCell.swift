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
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = UIColor.brown
        
        return label
    }()
    
    let scoreLabel: UILabel = {
        
        let label  = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.purple
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.gray
        layer.cornerRadius = 15.0
        contentView.addSubview(nameLabel)
        contentView.addSubview(scoreLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: contentView.frame.height/14),
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            scoreLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            scoreLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
