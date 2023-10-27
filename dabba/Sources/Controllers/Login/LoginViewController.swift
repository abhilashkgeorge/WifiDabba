//
//  LoginViewController.swift
//  dabba
//
//  Created by Abhilash K George on 25/10/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var pageTitle: UILabel!
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var appleButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        topImage.image = UIImage(named: ImageConstants.dabbaLite)
        pageTitle.text = "Wifi Dabba"
        
    }
    

    @IBAction func emailButtonClicked(_ sender: Any) {
        let viewController = storyboard?.instantiateViewController(identifier: SignInViewController.identifier) as! SignInViewController
        viewController.modalTransitionStyle = .crossDissolve
        navigationController?.pushViewController(viewController, animated: true)
    }


}
