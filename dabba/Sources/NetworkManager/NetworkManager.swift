//
//  NetworkManager.swift
//  dabba
//
//  Created by Abhilash K George on 26/10/23.
//

import Foundation

class NetworkManager {
    
    class func fetchData(URLString: String, completion: @escaping ([UserModel]?, String?) -> Void) {
        
        guard let url = URL(string: URLString) else {
            completion(nil, "Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, error?.localizedDescription ?? "Unknown error")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(nil, "HTTP Error")
                return
            }
            
            do {
                let userModel = try JSONDecoder().decode([UserModel].self, from: data)
                completion(userModel, nil)
            } catch {
                completion(nil, error.localizedDescription)
            }
        }.resume()
    }
}

