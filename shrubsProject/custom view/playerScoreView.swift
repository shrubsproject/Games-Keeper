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
    
    func setupFromPlayer(Player: Player, place: Int) {
        self.placeLabel.text = "#\(place)"
        self.nameLabel.text = Player.name
        self.scoreLabel.text = "\(Player.score)"
    }
    
    func commonInit(){
        addSubview(placeLabel)
        addSubview(nameLabel)
        addSubview(scoreLabel)
        
        placeLabel.font = UIFont(name: "Charter", size: 35)
        placeLabel.textColor = UIColor.white
        
        nameLabel.font = UIFont(name: "Charter", size: 32)
        nameLabel.textColor = UIColor(named: "Color-2")
        
        scoreLabel.font = UIFont(name: "Charter", size: 35)
        scoreLabel.textColor = UIColor.white
        
        placeLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            placeLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            placeLabel.leftAnchor.constraint(equalTo: leftAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leftAnchor.constraint(equalTo: placeLabel.rightAnchor, constant: 8.0),
            scoreLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            scoreLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10.0)
        ])
    }
}

