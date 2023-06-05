//
//  NewRepoRow.swift
//  gitTest
//
//  Created by Ardak Tursunbayev on 04.06.2023.
//

import SwiftUI

struct RepoRow: View {
    @State var repo : RepoModel
    @StateObject var history = ViewHistory.history
    var body: some View {
        if repo.full_name != ""{
            HStack{
                VStack{
                    Image("Repos")
                }
                VStack(alignment: .leading, spacing: 10){
                    Text(repo.full_name)
                        .font(.system(size: 18))
                        
                    Text(repo.html_url)
                        .font(.system(size: 14))
                        
                    
                    HStack{
                        Image(systemName: "star.fill")
                        Text("Score: \(repo.stargazers_count)")
                            .font(.system(size: 12))
                            
                        Spacer()
                        Text(repo.updated_at)
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing)
                }
            }
            .onTapGesture {
                if let url = URL(string: repo.html_url){
                    UIApplication.shared.open(url)
                }
                
                history.saved.insert(repo, at: 0)
                if history.saved.count>20{
                    history.saved.removeLast()
                }
                
            }
            .frame(height: 102)
            .bold()
            .foregroundColor(.white)
            .background(Color.black)
        }
        else{
            Text("There is no existing repository")
                .font(.system(size: 16))
                .foregroundColor(.white)
                .bold()
        }
        
    }
}

struct NewRepoRow_Previews: PreviewProvider {
    static var previews: some View {
        NavTabBar()
    }
}
