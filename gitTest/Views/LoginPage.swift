//
//  LoginPage.swift
//  gitTest
//
//  Created by Ardak Tursunbayev on 01.06.2023.
//

import SwiftUI

struct LoginPage: View {
    
    
    @EnvironmentObject var vm : TokenRetriever
    
    var body: some View {
        VStack{
            if vm.isAuthorized{
                NavTabBar()
            }
            else{
                VStack{
                    Image("git1")
                        .resizable()
                        .frame(width: 262, height: 263)
                        .aspectRatio(contentMode: .fit)
                    Button {
                        myAuth()
                    } label: {
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(.white)
                                .frame(width:350 ,height: 50)
                            Text("Login with GitHub")
                                .bold()
                                .font(.title3)
                                .padding()
                                .frame(width:350 ,height: 50)
                                .foregroundColor(.black)
                                
                        }
                        
                        
                    }

                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black)
                .onOpenURL { url in
                    let code = url.valueOf("code")!
                    vm.getToken(code)
                }
            }
            
        }
    }
    
    private func myAuth(){
        let clientID = "76ab3ff2742d740c0521"
        
        
        guard let url = URL(string: "https://github.com/login/oauth/authorize") else {return}
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        components?.queryItems = [
            URLQueryItem(name: "client_id", value: clientID)
            
        ]
        if let finalUrl = components?.url{
            if UIApplication.shared.canOpenURL(finalUrl) {
                UIApplication.shared.open(finalUrl)
            }
        }
    }

    
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}


