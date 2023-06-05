//
//  CustomTabBar.swift
//  gitTest
//
//  Created by Ardak Tursunbayev on 04.06.2023.
//

import SwiftUI

enum Tab: String, CaseIterable{
    case Search = "magnifyingglass"
    case History = "timer"
    case Profile = "person"
}

struct CustomTabBar: View {
    @Binding var selectedTab : Tab
    var body: some View {
        HStack(alignment: .bottom){
            ForEach(Tab.allCases, id: \.self){tab in
                Spacer()
                Image(systemName: "\(tab.rawValue)")
                    .font(.title)
                    .scaleEffect(selectedTab == tab ? 1.25 : 1)
                    .foregroundColor(selectedTab == tab ? Color(red: 32/255, green: 82/255, blue: 132/255): .black)
                    .onTapGesture {
                        withAnimation {
                            selectedTab = tab
                        }
                    }
                    .padding(.top)
                Spacer()
            }
        }
        .frame(height: 30)
        .background(Color.white)
        
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        NavTabBar()
    }
}
