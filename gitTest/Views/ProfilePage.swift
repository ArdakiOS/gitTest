//
//  ProfilePage.swift
//  gitTest
//
//  Created by Ardak Tursunbayev on 02.06.2023.
//

import SwiftUI

struct ProfilePage: View {
    @StateObject var fetch = FetchRepos()
    @State var text : String = ""
    var body: some View {
        NavigationStack() {
            VStack{
                Text("My repositories")
                    .font(.title)
                SearchBar(text: $text)
                    .padding(.bottom)
                
                ScrollView{
                    ForEach((fetch.myRepos), id: \.self){repo in
                        if text.isEmpty{
                            RepoRow(repo: repo)
                        }else{
                            if repo.full_name.lowercased().contains(text.lowercased()){
                                RepoRow(repo: repo)
                            }
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Profile")
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
                        MainPage()
                    } label: {
                        HStack{
                            Image(systemName: "house")
                            Text("Main")
                        }
                        .bold()
                        .foregroundColor(.black)
                    }
                    
                    
                }
            }
            .onAppear{
                fetch.getMyRepos()
            }
        }
        
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}
