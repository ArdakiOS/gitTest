//
//  NewMainPage.swift
//  gitTest
//
//  Created by Ardak Tursunbayev on 04.06.2023.
//

import SwiftUI

struct Search: View {
    
    @StateObject var fetch = FetchRepos()
    @State var byUser = true
    @State var text = ""
    @State var pageNum = 1
    
    var body: some View {
        VStack{
            Text("Search")
                .foregroundColor(.white)
                .font(.title)
            SearchBar(text: $text)
                .overlay(alignment: .trailing) {
                    Button {
                        pageNum = 1
                        if byUser{
                            fetch.getUsers(name: text, pageNum: pageNum)
                        }
                        else if !byUser{
                            fetch.getRepoByName(name: text, pageNum: pageNum)
                        }
                    } label: {
                        
                        Image(systemName: "magnifyingglass")
                        
                    }
                    .padding(.trailing, 25)
                    .foregroundColor(.white)
                    .font(.title3)
                    
                }
            HStack{
                
                Button {
                    withAnimation(.easeInOut(duration: 0.5)){
                        byUser = true
                    }
                    
                } label: {
                    Text("Search by username")
                }
                
                .overlay(alignment: .bottom) {
                    if byUser{
                        Capsule()
                            .frame(height: 2)
                    }
                }
                .padding(.trailing)
                
                
                Button {
                    withAnimation(.easeInOut(duration: 0.5)){
                        byUser = false
                    }
                    
                } label: {
                    Text("Search by reponame")
                }
                .overlay(alignment: .bottom) {
                    if !byUser{
                        Capsule()
                            .frame(height: 2)
                    }
                }
                
            }
            .padding(.bottom)
            .foregroundColor(.white)
            
            HStack{
                Spacer()
                Button {
                    pageNum -= 1
                    if !byUser{
                        fetch.getRepoByName(name: text, pageNum: pageNum)
                    }
                    else {
                        fetch.getUsers(name: text, pageNum: pageNum)
                    }
                    
                } label: {
                    Image(systemName: "chevron.left")
                }
                
                Button {
                    pageNum += 1
                    if !byUser{
                        fetch.getRepoByName(name: text, pageNum: pageNum)
                    }
                    else {
                        fetch.getUsers(name: text, pageNum: pageNum)
                    }
                } label: {
                    Image(systemName: "chevron.right")
                }
                
                Text("Page number \(pageNum)")
                Spacer()


            }
            .buttonStyle(.borderedProminent)
            .foregroundColor(.white)
            
            if fetch.loading == true{
                LoadingView()
            }
            else{
                ScrollView{
                    if byUser{
                        
                        ForEach((fetch.user), id: \.self){ users in
                            VStack{
                                UserRow(user: users)
                                Rectangle()
                                    .foregroundColor(Color(red: 90/255, green: 90/255, blue: 90/255))
                                    .frame(height: 1)
                            }
                        }
                    }
                    else{
                        if fetch.loading == true{
                            LoadingView()
                        }
                        ForEach((fetch.res), id: \.self){ repo in
                            VStack{
                                RepoRow(repo: repo)
                                Rectangle()
                                    .foregroundColor(Color(red: 90/255, green: 90/255, blue: 90/255))
                                    .frame(height: 1)
                            }
                        }
                    }
                    
                }
                
            }
            Spacer()
            
        }
        .background(Color.black)
    }
        
}

struct NewMainPage_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}
