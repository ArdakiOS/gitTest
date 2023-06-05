//
//  NewHistoryPage.swift
//  gitTest
//
//  Created by Ardak Tursunbayev on 04.06.2023.
//

import SwiftUI

struct HistoryPage: View {
    
    @StateObject var fetch = FetchRepos()
    @StateObject var history = ViewHistory.history
    @State var saved : [RepoModel] = []
    @State var text = ""
    var body: some View {
        VStack{
            Text("History")
                .foregroundColor(.white)
                .font(.title)
            
            SearchBar(text: $text)
            ScrollView{
                
                if(history.saved.isEmpty) {
                    Text("History is clear")
                        .foregroundColor(.white)
                }
                else{
                    if text.isEmpty{
                        ForEach((history.saved), id: \.self){repo in
                            RepoRow(repo: repo)
                        }
                    }
                    else{
                        ForEach((history.saved), id: \.self){repo in
                            if repo.full_name.lowercased().contains(text.lowercased()){
                                RepoRow(repo: repo)
                            }
                            
                        }
                    }
                    
                }
            }
        }
        .background(Color.black)
        
    }
}

struct NewHistoryPage_Previews: PreviewProvider {
    static var previews: some View {
        HistoryPage()
    }
}
