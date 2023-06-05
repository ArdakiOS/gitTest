//
//  ViewHistory.swift
//  gitTest
//
//  Created by Ardak Tursunbayev on 02.06.2023.
//

import Foundation

class ViewHistory : ObservableObject{
    static let history = ViewHistory()
    var owner  = FetchRepos().login
    
    @Published var saved : [RepoModel]{
        didSet{
            let encoder = JSONEncoder()
            if let encodedData = try? encoder.encode(saved){
                UserDefaults.standard.set(encodedData, forKey: "data")
            }
        
        }
        
    }
    
    init() {
        if let encoded = UserDefaults.standard.data(forKey: "data"){
            do{
                let decoded = try JSONDecoder().decode([RepoModel].self, from: encoded)
                saved = decoded
            }
            catch{
                print(error)
                saved = []
            }
        }
        else{
            saved = []
        }
    }
    
}


