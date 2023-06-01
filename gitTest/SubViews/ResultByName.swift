//
//  ResultRow.swift
//  gitTest
//
//  Created by Ardak Tursunbayev on 01.06.2023.
//

import SwiftUI

struct ResultByName: View {
    @State var user : UserModel
    var body: some View {
        NavigationStack{
            NavigationLink {
                UsersAllRepos(reposUrl: user.repos_url, userName: user.login)
            } label: {
                HStack{
                    AsyncImage(url: URL(string: user.avatar_url)){image in
                        image
                            .resizable()
                            .frame(width: 125, height: 125)
                            .aspectRatio(contentMode: .fit)
                    }placeholder: {
                        ProgressView()
                    }
                    VStack(alignment: .leading){
                        Text(user.login)
                        Text(user.html_url)
                    }
                    .multilineTextAlignment(.leading)
                    
                    Spacer()
                }
                .foregroundColor(.black)
            }
        }
    }
}

struct ResultRow_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
