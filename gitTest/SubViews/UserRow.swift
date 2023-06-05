//
//  UserRow.swift
//  gitTest
//
//  Created by Ardak Tursunbayev on 04.06.2023.
//

import SwiftUI

struct UserRow: View {
    @State var user : UserModel
    @StateObject var fetch = FetchRepos()
    var body: some View {
        DisclosureGroup {
            ForEach(fetch.usersRepo , id: \.self) { repo in
                RepoRow(repo: repo)
            }
        } label: {
            HStack{
                VStack{
                    AsyncImage(url: URL(string: user.avatar_url)) { image in
                        image
                            .resizable()
                            .frame(width: 90, height: 90)
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                            .tint(.white)
                            .scaleEffect(1.5)
                            .frame(width: 90, height: 90)
                    }

                }
                VStack(alignment: .leading, spacing: 10){
                    Text(user.login)
                        .font(.system(size: 18))
                        
                    Text(user.html_url)
                        .font(.system(size: 14))
                    
                    HStack{
                        Text("")
                        Spacer()
                    }
                }
            }
            .frame(height: 102)
            .bold()
            .foregroundColor(.white)
            .background(Color.black)
            .onAppear{
                fetch.getUsersRepo(user: user.repos_url)
            }
        }

        
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        NavTabBar()
    }
}
