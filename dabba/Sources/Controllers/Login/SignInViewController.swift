//
//  SignInViewController.swift
//  dabba
//
//  Created by Abhilash K George on 25/10/23.
//

import UIKit

class SignInViewController: UIViewController {
    
    static let identifier = Identifiers.signInViewController
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameTextFeild: FloatingLabel!
    @IBOutlet weak var emailTextFeild: FloatingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextFeild.delegate = self
        emailTextFeild.delegate = self
        setupUI()
        setupNavBar()

        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        logoImageView.image = UIImage(named: ImageConstants.logo)
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.tintColor = .black
        self.navigationItem.setHidesBackButton(true, animated: true)
        let logo = UIBarButtonItem(image: UIImage(systemName: ImageConstants.back) , style: UIBarButtonItem.Style.plain, target: self, action: #selector(backBtnTapped))
        self.navigationItem.leftBarButtonItem = logo
    }
    
    @objc func backBtnTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        guard emailTextFeild.text != "" || nameTextFeild.text != "" else {
            return
        }
        let storyBoard = UIStoryboard(name: StoryBoards.tabBar, bundle: nil)
        let viewController = storyBoard.instantiateViewController(identifier: CustomTabBarController.identifier) as! UITabBarController
        UserDefaults.standard.set(nameTextFeild.text, forKey: UserDefaultConstants.savedName)
        UserDefaults.standard.set(emailTextFeild.text, forKey: UserDefaultConstants.savedEmail)
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .crossDissolve
        present(viewController, animated: true)
        
    }
}


extension SignInViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
