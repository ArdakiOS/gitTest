//
//  NewProfile.swift
//  gitTest
//
//  Created by Ardak Tursunbayev on 04.06.2023.
//

import SwiftUI

struct Profile: View {
    @StateObject var fetch = FetchRepos()
    
    @EnvironmentObject var vm : TokenRetriever
    
    var body: some View {
        VStack{
            Text("Profile")
                .foregroundColor(.white)
                .font(.title)
                .onAppear{
                    fetch.getMyRepos()
                }
            Image("git1")
                .resizable()
                .frame(width: 262, height: 263)
                .aspectRatio(contentMode: .fit)
            
            Spacer()
            ScrollView{
                ZStack{
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 350, height: 50)
                        .foregroundColor(.white)
                    DisclosureGroup {
                        ForEach((fetch.myRepos), id: \.self){repo in
                            RepoRow(repo: repo)
                        }
                    } label: {
                        Button {
                            //
                        } label: {
                            HStack{
                                Text("See my repositories")
                                    .font(.system(size: 20))
                                    .foregroundColor(.black)
                                    .bold()
                            }
                            
                        }
                        .foregroundColor(.white)
                        .frame(width: 350, height: 50)
                        
                    }
                }
                
                
                ZStack{
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 350, height: 50)
                        .foregroundColor(.white)
                    Button {
                        vm.signOut()
                    } label: {
                        HStack{
                            Image("git2")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                            Text("Log Out")
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                                .bold()
                            
                        }
                        .frame(width: 350, height: 50)
                        
                    }
                    .foregroundColor(.white)
                    .frame(width: 350, height: 50)
                }
                
            }
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        
        
        
        
        
        
    }
}

struct NewProfile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
