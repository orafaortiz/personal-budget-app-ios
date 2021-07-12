//
//  TextField.swift
//  Rafa's Budget
//
//  Created by Rafael Ortiz on 10/07/21.
//

import UIKit
import LBTATools

extension UITextField {
    
    func forBlackBackground(placeholderText: String, keyboard: UIKeyboardType = .default) -> UITextField {
        
        let field = IndentedTextField(placeholder: placeholderText, padding: 12, cornerRadius: 5, keyboardType: keyboard)
        
        field.constrainHeight(50)
        //field.layer.borderColor = UIColor.white.cgColor
        //field.layer.borderWidth = 1.0
        field.placeHolderColor = .lightGray
        field.textColor = UIColor(named: "AntiqueWhite")
        field.backgroundColor = .darkGray
        
        return field
    }
    
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
    
}
