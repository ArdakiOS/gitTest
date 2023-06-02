//
//  GitHubAuthView.swift
//  gitTest
//
//  Created by Ardak Tursunbayev on 02.06.2023.
//

import SwiftUI
import OAuth2

struct GitHubAuthView: View {
    @StateObject private var oauth2 = OAuth2CodeGrant(settings: [
        "client_id": "76ab3ff2742d740c0521",
        "client_secret": "630f22274d9a453327dee263fb7e1c7455441390",
        "authorize_uri": "https://github.com/login/oauth/authorize",
        "token_uri": "https://github.com/login/oauth/access_token",
        "scope": "user",
        "redirect_uris": ["https://localhost:3000"],
        "verbose": true
    ])
    var body: some View {
        VStack{
            if oauth2.isAuthorizing {
                Text("Authorizing")
            }
            else if oauth2.accessToken =! {
                print("Token: \(oauth2.accessToken)")
            }
            else{
                Button {
                    oauth2.authorize { <#OAuth2JSON?#>, <#OAuth2Error?#> in
                        <#code#>
                    }
                } label: {
                    Text("Auth")
                }

            }
        }
    }
}

struct GitHubAuthView_Previews: PreviewProvider {
    static var previews: some View {
        GitHubAuthView()
    }
}

extension OAuth2CodeGrant : ObservableObject{}
