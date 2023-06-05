//
//  gitTestApp.swift
//  gitTest
//
//  Created by Ardak Tursunbayev on 01.06.2023.
//

import SwiftUI

@main
struct gitTestApp: App {
    
    @StateObject var state = TokenRetriever()
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                LoginPage()
            }
            .environmentObject(state)
            
        }
    }
}


