//
//  ViewHistory.swift
//  gitTest
//
//  Created by Ardak Tursunbayev on 02.06.2023.
//

import Foundation

class ViewHistory : ObservableObject{
    static let history = ViewHistory()
    
    @Published var viwedRepos : [RepoModel]{
        didSet{
            do{
                let encoded = try JSONEncoder().encode(viwedRepos)
                UserDefaults.standard.set(encoded, forKey: "History")
            }
            catch{
                print(error.localizedDescription)
            }
            
        }
    }
    
    init() {
        if let encoded = UserDefaults.standard.data(forKey: "History"){
            do{
                let decoded = try JSONDecoder().decode([RepoModel].self, from: encoded)
                viwedRepos = decoded
            }
            catch{
                print(error.localizedDescription)
                viwedRepos = []
            }
        }
        else {
            viwedRepos = []
        }
    }
}
