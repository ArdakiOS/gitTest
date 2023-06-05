//
//  TokenRetriever.swift
//  gitTest
//
//  Created by Ardak Tursunbayev on 02.06.2023.
//

import Foundation

class TokenRetriever : ObservableObject{
    
    @Published var token : String {
        didSet{
            UserDefaults.standard.set(token, forKey: "accessToken")
        }
    }
    @Published var isAuthorized : Bool {
        didSet{
            UserDefaults.standard.set(isAuthorized, forKey: "status")
        }
    }
    
    @Published var loading = false
    
    init(){
        isAuthorized = UserDefaults.standard.bool(forKey: "status")
        token = UserDefaults.standard.string(forKey: "accessToken") ?? ""
    }
    func signOut(){
        UserDefaults.standard.removeObject(forKey: "accessToken")
        UserDefaults.standard.synchronize()
        self.isAuthorized = false
    }
    
    func getToken(_ code : String){
        self.loading = true
        let urlString = "https://github.com/login/oauth/access_token?client_id=76ab3ff2742d740c0521&client_secret=630f22274d9a453327dee263fb7e1c7455441390&code=\(code)"
        guard let url = URL(string: urlString) else {return}
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        
        let urlConfig = URLSessionConfiguration.default
        
        urlConfig.httpAdditionalHeaders = [
            "Accept": "application/json"
        ]
        
        let session = URLSession(configuration: urlConfig)
        
        let task = session.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {return}
            
            do{
                let response = try JSONDecoder().decode(TokenModel.self, from: data)
                DispatchQueue.main.async {
                    
                    self.token = response.access_token
                    
                    self.loading = false
                    self.isAuthorized = true
                    
                }
            }
            catch{
                print(error)
                print(error.localizedDescription)
            }
            
        }
        
        task.resume()
    }
}
