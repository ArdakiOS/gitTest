//
//  RepoRow.swift
//  gitTest
//
//  Created by Ardak Tursunbayev on 01.06.2023.
//

import SwiftUI

struct RepoRow: View {
    @State var repo : RepoModel
    @StateObject var history = ViewHistory.history
    var body: some View {
        
        VStack(alignment: .leading){
            HStack{
                Text("Name: \(Text(repo.full_name).foregroundColor(.pink))")
                Spacer()
            }
            
            Text("Link: \(Text(repo.html_url).foregroundColor(.orange))")
        }
        
        .foregroundColor(.black)
        .bold()
        .multilineTextAlignment(.leading)
        .padding()
        .frame(maxWidth: .infinity)
        .overlay {
            RoundedRectangle(cornerRadius: 10).stroke()
        }
        .padding(.bottom)
        .padding(.horizontal)
        .onTapGesture {
            if let url = URL(string: repo.html_url){
                UIApplication.shared.open(url)
            }
            history.viwedRepos.append(repo)
            if history.viwedRepos.count > 20{
                history.viwedRepos = Array(history.viwedRepos.dropFirst())
            }
        }
        
        
        
    }
}

struct RepoRow_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
