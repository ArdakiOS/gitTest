//
//  MainPage.swift
//  gitTest
//
//  Created by Ardak Tursunbayev on 01.06.2023.
//

import SwiftUI

struct MainPage: View {
    @StateObject var fetch = FetchRepos()
    @State var text : String = ""
    @State var byUser = true
    var body: some View {
        NavigationStack() {
            VStack{
                SearchBar(text: $text)
                    .padding(.bottom)
                HStack{
                    
                    Toggle(isOn: $byUser) {
                        Text("Serach by RepoName")
                    }
                    .frame(width: 150)
                    
                    Text("Search by userName")
                        .frame(width: 150)
                    
                    Button {
                        if byUser{
                            fetch.getUsers(name: text)
                        }
                        else{
                            fetch.getRepoByName(name: text)
                        }
                    } label: {
                        Text("Find")
                    }
                    .padding()
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 2)
                    })
                    .foregroundColor(.black)
                    
                    

                }
                
                
                ScrollView{
                    if byUser{
                        ForEach((fetch.user), id:\.self){ user in
                            ResultByName(user: user)
                        }
                    }
                    else{
                        ForEach((fetch.res), id: \.self){ repo in
                            RepoRow(repo: repo)
                        }
                    }
                    Spacer()
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationTitle("GitHub")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        HistoryPage()
                    } label: {
                        HStack{
                            Image(systemName: "book.closed.fill")
                            Text("History")
                        }
                        .bold()
                        .foregroundColor(.black)
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink {
                        ProfilePage()
                    } label: {
                        HStack{
                            Image(systemName: "person")
                            Text("Profile")
                        }
                        .bold()
                        .foregroundColor(.black)
                    }

                    
                }
            }
        }
        
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
