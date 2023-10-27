//
//  ContactsViewController.swift
//  dabba
//
//  Created by Abhilash K George on 26/10/23.
//

import UIKit

class ContactsViewController: UIViewController {
    
    let contactsViewModel = ContactsViewModel()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        loadUsers()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavBar()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ContactTableViewCell", bundle: nil), forCellReuseIdentifier: "ContactTableViewCell")
    }
    
    private func setupNavBar() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @objc func backBtnTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func loadUsers() {
        contactsViewModel.getUserList { users, error in
            self.tableView.reloadData()
        }
    }


}


extension ContactsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsViewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell") as? ContactTableViewCell {
            cell.configureCell(model: contactsViewModel.users[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = CustomSectionHeaderView()
        headerView.setTitle("Contacts") // Set the section header title here
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = storyboard?.instantiateViewController(identifier: ContactDetailViewController.identifier) as! ContactDetailViewController
        viewController.contactDetail = contactsViewModel.users[indexPath.row]
        viewController.modalTransitionStyle = .crossDissolve
        navigationController?.pushViewController(viewController, animated: true)
    }
}
