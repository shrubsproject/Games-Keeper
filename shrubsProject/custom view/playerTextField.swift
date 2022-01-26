//
//  playerTextField.swift
//  shrubsProject
//
//  Created by Ilya Egorov on 07.01.2022.
//

import UIKit

class playerTextField: UITextField {
    
    private let edgeInsets = UIEdgeInsets(top: 20, left: 25, bottom: 15, right: 25)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: edgeInsets)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: edgeInsets)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: edgeInsets)
    }
}
