//
//  CustomButtons.swift
//  dabba
//
//  Created by Abhilash K George on 26/10/23.
//

import UIKit

class BrandColourButton: UIButton {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupMainOrangeFilledButton()
    }
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        setupMainOrangeFilledButton()
    }
    
    func setupMainOrangeFilledButton() -> Void {
    
//        self.titleLabel?.font = UIFont(s)
        self.layer.cornerRadius = 6
        self.setTitleColor(UIColor.white, for: .selected)
        self.backgroundColor = UIColor(red: 236/255, green: 175/255, blue: 53/255,alpha: 1)
    }
}
