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
        TextField("Search", text: $text)
            .padding(10)
            .overlay {
                RoundedRectangle(cornerRadius: 5).stroke(.black, lineWidth: 1)
            }
            .padding(.horizontal)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
