//
//  playerScoreView.swift
//  shrubsProject
//
//  Created by Ilya Egorov on 31.01.2022.
//

import UIKit

class PlayerScoreView: UIView {
    
    var placeLabel = UILabel()
    var nameLabel = UILabel()
    var scoreLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func setupFromPlayer(players: Player, place: Int) {
        self.placeLabel.text = "#\(place)"
        self.nameLabel.text = "\(players.name)"
        self.scoreLabel.text = "\(players.score)"
    }
    
    func commonInit(){
        addSubview(placeLabel)
        addSubview(nameLabel)
        addSubview(scoreLabel)
        
        placeLabel.font = UIFont(name: "Charter", size: 28)
        placeLabel.textColor = UIColor.white
        
        nameLabel.font = UIFont(name: "Charter", size: 28)
        nameLabel.textColor = UIColor(named: "Color-2")
        
        scoreLabel.font = UIFont(name: "Charter", size: 28)
        scoreLabel.textColor = UIColor.white
        
        placeLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            placeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            placeLabel.leftAnchor.constraint(equalTo: leftAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leftAnchor.constraint(equalTo: placeLabel.rightAnchor),
            scoreLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            scoreLabel.leftAnchor.constraint(equalTo: rightAnchor, constant: -40.0)
        ])
    }
}

