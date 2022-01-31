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
    
    func setupFromPlayer(player: Player, place: Int) {
        self.placeLabel.text = "#\(place)"
        self.nameLabel.text = player.name
        self.scoreLabel.text = "\(player.score)"
    }
    
    func commonInit(){
        addSubview(placeLabel)
        addSubview(nameLabel)
        addSubview(scoreLabel)
        
        placeLabel.font = UIFont.systemFont(ofSize: 30)
        placeLabel.textColor = UIColor.white
        
        nameLabel.font = UIFont.systemFont(ofSize: 30)
        nameLabel.textColor = UIColor.white
        
        scoreLabel.font = UIFont.systemFont(ofSize: 30)
        scoreLabel.textColor = UIColor.white
        
        placeLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            placeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            placeLabel.leftAnchor.constraint(equalTo: leftAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leftAnchor.constraint(equalTo: placeLabel.rightAnchor),
            scoreLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            scoreLabel.leftAnchor.constraint(equalTo: rightAnchor, constant: -10.0)
        ])
    }
}
