//
//  ContactDetailViewController.swift
//  dabba
//
//  Created by Abhilash K George on 26/10/23.
//

import UIKit

class ContactDetailViewController: UIViewController {
    
    static let identifier = "ContactDetailViewController"
    
    var contactDetail: UserModel?

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupTableView()
    }
    
    private func setupNavBar() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = .white
        self.navigationItem.setHidesBackButton(true, animated: true)
        let logo = UIBarButtonItem(image: UIImage(systemName: "chevron.backward") , style: UIBarButtonItem.Style.plain, target: self, action: #selector(backBtnTapped))
        self.navigationItem.leftBarButtonItem = logo
    }
    
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: ContactDetailTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ContactDetailTableViewCell.identifier)
    }
    
    @objc func backBtnTapped() {
        self.navigationController?.popViewController(animated: true)
    }

}

extension ContactDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let viewModel = contactDetail, let cell = tableView.dequeueReusableCell(withIdentifier: ContactDetailTableViewCell.identifier) as? ContactDetailTableViewCell {
            cell.configure(model: viewModel)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    
}
