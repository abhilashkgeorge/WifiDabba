//
//  CustomTabBarController.swift
//  dabba
//
//  Created by Abhilash K George on 26/10/23.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    static let identifier = "CustomTabBarController"
    
    @IBInspectable var initialIndex = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndex = initialIndex
    }
    


}
