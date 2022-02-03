//
//  playerTextField.swift
//  shrubsProject
//
//  Created by Ilya Egorov on 07.01.2022.
//

import UIKit

class playerTextField: UITextField {
    
    private let edgeInsets = UIEdgeInsets(top: 18, left: 24, bottom: 18, right: 24)
    
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
