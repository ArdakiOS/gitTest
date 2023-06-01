//
//  HistoryPage.swift
//  gitTest
//
//  Created by Ardak Tursunbayev on 01.06.2023.
//

import SwiftUI

struct HistoryPage: View {
    @State var text : String = ""
    var body: some View {
        NavigationStack() {
            VStack{
                SearchBar(text: $text)
                    .padding(.bottom)
            }
            .navigationBarBackButtonHidden(true)
            .navigationTitle("GitHub")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
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

struct HistoryPage_Previews: PreviewProvider {
    static var previews: some View {
        HistoryPage()
    }
}
