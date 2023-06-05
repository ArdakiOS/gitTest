//
//  SwiftUIView.swift
//  gitTest
//
//  Created by Ardak Tursunbayev on 04.06.2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        
            ProgressView()
                .tint(.white)
                .scaleEffect(2)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black)
        
            
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
