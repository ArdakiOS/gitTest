//
//  LoginPage.swift
//  gitTest
//
//  Created by Ardak Tursunbayev on 01.06.2023.
//

import SwiftUI

struct LoginPage: View {
    
    @State var isLoggedIn = false

    var body: some View {
        VStack{
            if isLoggedIn{
                MainPage()
            }
            else{
                VStack{
                    Image("git")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Button {
                        //
                    } label: {
                        Text("Login with GitHub")
                            .bold()
                            .font(.title3)
                            .padding()
                            .frame(height: 30)
                            .overlay {
                                RoundedRectangle(cornerRadius: 5).stroke(.black, lineWidth: 1)
                            }
                            .foregroundColor(.white)
                            .background(Color.black)
                        
                    }

                }
            }
            
        }
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
