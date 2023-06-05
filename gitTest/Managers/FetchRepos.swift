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
    @Published var usersRepo : [RepoModel] = []
    @Published var login : String = ""
    @Published var loading = false
    
    func getLogin () {
        
            let token = UserDefaults.standard.string(forKey: "accessToken")
            
            let urlString = "https://api.github.com/user"
            guard let url = URL(string: urlString) else {return}
            
            let urlConfig = URLSessionConfiguration.default
            urlConfig.httpAdditionalHeaders = [
                "Authorization" : "Bearer \(token!)"
            ]
            
            let session = URLSession(configuration: urlConfig)
            
            let task = session.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else {return}
                
                do{
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(UserModel.self, from: data)
                    
                    DispatchQueue.main.async {
                        self.login = result.login
                        
                    }
                }
                catch{
                    print(error)
                }
            }
            task.resume()
    }
    
    func getMyRepos(){
        
        let token = UserDefaults.standard.string(forKey: "accessToken")
        
        
        let urlString = "https://api.github.com/user/repos"
        guard let url = URL(string: urlString) else {return}
        
        let urlConfig = URLSessionConfiguration.default
        urlConfig.httpAdditionalHeaders = [
            "Authorization" : "Bearer \(token!)"
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
    
    func getRepoByName(name: String, pageNum : Int){
        self.loading = true
        let token = UserDefaults.standard.string(forKey: "accessToken")
        
        let urlString = "https://api.github.com/search/repositories?q=\(name)&order=desc&sort=stars&per_page=30&page=\(pageNum)"
        guard let url = URL(string: urlString) else {return}
        
        let urlConfig = URLSessionConfiguration.default
        urlConfig.httpAdditionalHeaders = [
            "Authorization" : "Bearer \(token!)"
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
                    self.loading = false
                }
            }
            catch{
                print(error)
            }
        }
        task.resume()
    }
    
    func getUsers(name : String, pageNum : Int) {
        self.loading = true
        let token = UserDefaults.standard.string(forKey: "accessToken")
    
        let urlString = "https://api.github.com/search/users?q=\(name)&sort=followers&order=desc&per_page=30&page=\(pageNum)"
        guard let url = URL(string: urlString) else {return}
        
        let urlConfig = URLSessionConfiguration.default
        urlConfig.httpAdditionalHeaders = [
            "Authorization" : "Bearer \(token!)"
        ]
        
        let session = URLSession(configuration: urlConfig)
        
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {return}
            
            do{
                let decoder = JSONDecoder()
                let result = try decoder.decode(UserModelResponse.self, from: data)
                
                DispatchQueue.main.async {
                    self.user = result.items
                    self.loading = false
                }
            }
            catch{
                print(error)
            }
        }
        task.resume()
    }
    
    func getUsersRepo(user: String) {
        self.loading = true
        let token = UserDefaults.standard.string(forKey: "accessToken")
        let urlString = user
        guard let url = URL(string: urlString) else {return}
        
        let urlConfig = URLSessionConfiguration.default
        urlConfig.httpAdditionalHeaders = [
            "Authorization" : "Bearer \(token!)"
        ]
        
        let session = URLSession(configuration: urlConfig)
        
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            guard let data = data, error == nil else {return}
            
            do{
                let decoder = JSONDecoder()
                let result = try decoder.decode([RepoModel].self, from: data)
//                print(result)
                DispatchQueue.main.async {
                    
                    self.usersRepo = result
                    self.loading = false
                }
            }
            catch{
                print(error)
            }
        })
        
        task.resume()
    }
    
    
}
