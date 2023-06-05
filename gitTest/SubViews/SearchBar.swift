//
//  SearchBar.swift
//  gitTest
//
//  Created by Ardak Tursunbayev on 01.06.2023.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text : String
    var body: some View {
        ZStack{
            HStack{
                Text("Enter the name")
                    .padding(.leading, 25)
                    .foregroundColor(.white)
                    .opacity(text.isEmpty ? 1 : 0)
                Spacer()
            }
            TextField("", text: $text)
                .foregroundColor(.white)
                .padding(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 5).stroke(.white, lineWidth: 1)
                }
                .padding(.horizontal)
        }
        
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        NavTabBar()
    }
}
