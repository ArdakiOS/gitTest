//
//  FetchRepos.swift
//  gitTest
//
//  Created by Ardak Tursunbayev on 01.06.2023.
//

import Foundation

class FetchRepos : ObservableObject{
    @Published var res : [RepoModel] = []
    @Published var user : [UserModel] = []
    @Published var myRepos : [RepoModel] = []
    
    func getMyRepos(){
        let urlString = "https://api.github.com/user/repos"
        guard let url = URL(string: urlString) else {return}
        
        let urlConfig = URLSessionConfiguration.default
        urlConfig.httpAdditionalHeaders = [
            "Authorization" : "Bearer \(TestToken.token)"
        ]
        
        let session = URLSession(configuration: urlConfig)
        
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {return}
            
            do{
                let decoder = JSONDecoder()
                let result = try decoder.decode([RepoModel].self, from: data)
                
                DispatchQueue.main.async {
                    self.myRepos = result
                }
            }
            catch{
                print(error)
            }
        }
        task.resume()
    }
    
    func getRepoByName(name: String){
        let urlString = "https://api.github.com/search/repositories?q=\(name)"
        guard let url = URL(string: urlString) else {return}
        
        let urlConfig = URLSessionConfiguration.default
        urlConfig.httpAdditionalHeaders = [
            "Authorization" : "Bearer \(TestToken.token)"
        ]
        
        let session = URLSession(configuration: urlConfig)
        
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {return}
            
            do{
                let decoder = JSONDecoder()
                let result = try decoder.decode(RepoModelByName.self, from: data)
                print(result)
                DispatchQueue.main.async {
                    self.res = result.items
                }
            }
            catch{
                print(error)
            }
        }
        task.resume()
    }
    
    func getUsers(name : String) {
        let urlString = "https://api.github.com/search/users?q=\(name)"
        guard let url = URL(string: urlString) else {return}
        
        let urlConfig = URLSessionConfiguration.default
        urlConfig.httpAdditionalHeaders = [
            "Authorization" : "Bearer \(TestToken.token)"
        ]
        
        let session = URLSession(configuration: urlConfig)
        
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {return}
            
            do{
                let decoder = JSONDecoder()
                let result = try decoder.decode(UserModelResponse.self, from: data)
                print(result)
                DispatchQueue.main.async {
                    self.user = result.items
                }
            }
            catch{
                print(error)
            }
        }
        task.resume()
    }
    
    func getUsersRepo(user: String) {
        let urlString = user
        guard let url = URL(string: urlString) else {return}
        
        let urlConfig = URLSessionConfiguration.default
        urlConfig.httpAdditionalHeaders = [
            "Authorization" : "Bearer \(TestToken.token)"
        ]
        
        let session = URLSession(configuration: urlConfig)
        
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            guard let data = data, error == nil else {return}
            
            do{
                let decoder = JSONDecoder()
                let result = try decoder.decode([RepoModel].self, from: data)
//                print(result)
                DispatchQueue.main.async {
                    self.res = result
                }
            }
            catch{
                print(error)
            }
        })
        
        task.resume()
    }
    
    
}
