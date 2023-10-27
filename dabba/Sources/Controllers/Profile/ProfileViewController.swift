//
//  ProfileViewController.swift
//  dabba
//
//  Created by Abhilash K George on 26/10/23.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupUI()
    }
    
    func setupUI() {
        if let savedName = UserDefaults.standard.string(forKey: "SavedName"), let savedEmail = UserDefaults.standard.string(forKey: "SavedEmail") {
            nameLabel.text = savedName
            emailLabel.text = savedEmail
        }
    }
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Login", bundle: .main)
        let viewController = storyBoard.instantiateViewController(identifier: "SignInViewController") as! SignInViewController
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .crossDissolve
        present(viewController, animated: true)
        
    }
    
    
    

}
