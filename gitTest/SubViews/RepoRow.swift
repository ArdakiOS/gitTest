//
//  RepoRow.swift
//  gitTest
//
//  Created by Ardak Tursunbayev on 01.06.2023.
//

import SwiftUI

struct RepoRow: View {
    @State var repo : RepoModel
    var body: some View {
        Link(destination: URL(string: repo.html_url)!) {
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
        }
        
    }
}

struct RepoRow_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
