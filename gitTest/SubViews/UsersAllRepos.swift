//
//  ReposView.swift
//  gitTest
//
//  Created by Ardak Tursunbayev on 01.06.2023.
//

import SwiftUI

struct UsersAllRepos: View {
    @State var reposUrl : String
    @State var userName : String
    @StateObject var fetch = FetchRepos()
    var body: some View {
        VStack{
            Text("Repostiories of \(userName)")
                .font(.title)
                
            ScrollView{
                ForEach((fetch.res), id: \.self){repo in
                    RepoRow(repo: repo)
                }
            }
        }
        .onAppear{
            fetch.getUsersRepo(user: reposUrl)
        }
    }
}

struct ReposView_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
