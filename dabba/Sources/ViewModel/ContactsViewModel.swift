//
//  ContactsViewModel.swift
//  dabba
//
//  Created by Abhilash K George on 26/10/23.
//

import UIKit

class ContactsViewModel {
    
    var users = [UserModel]()
    
    func getUserList(completion: @escaping ([UserModel]?, String?) -> Void ) {
        let urlString: String = "https://jsonplaceholder.typicode.com/users"

        NetworkManager.fetchData(URLString: urlString) { users, error in
            if let users = users  {
                self.users = users
                
                // Perform UI updates on the main thread
                DispatchQueue.main.async {
                    completion(users, nil)
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }
    }

}
