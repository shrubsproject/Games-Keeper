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
    var style: userCell.Style = .user{
        willSet{
        if newValue == .user {
            imageView?.image = UIImage(named: "oi")
            textLabel?.font = UIFont.systemFont(ofSize: 20)
            textLabel?.textColor = UIColor.white
        }
        else {
            imageView?.image = UIImage(named: "yu")
            textLabel?.font = UIFont.systemFont(ofSize: 16)
            textLabel?.text = "Add player"
            textLabel?.textColor = UIColor(named: "AppJade")
        }
    }
}
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        imageView?.isUserInteractionEnabled = true
        imageView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped)))
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
}
    @objc func imageTapped(){
        if let handler = handler {
            handler()
        }
    }
}

