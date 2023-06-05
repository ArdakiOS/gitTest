//
//  NavTabBar.swift
//  gitTest
//
//  Created by Ardak Tursunbayev on 04.06.2023.
//

import SwiftUI

struct NavTabBar: View {
    @State private var selectedTab : Tab = .Search
    @StateObject var fetch = FetchRepos()
    var body: some View {
        ZStack{
            VStack{
                TabView(selection: $selectedTab) {
                    Search()
                        .tag(Tab.Search)
                    HistoryPage()
                        .tag(Tab.History)
                    Profile()
                        .tag(Tab.Profile)
                }
                Spacer()
                CustomTabBar(selectedTab: $selectedTab)
            }
            
        }
        
        
    }
}

struct NavTabBar_Previews: PreviewProvider {
    static var previews: some View {
        NavTabBar()
    }
}
