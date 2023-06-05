//
//  TokenModel.swift
//  gitTest
//
//  Created by Ardak Tursunbayev on 02.06.2023.
//

import Foundation
struct TokenModel : Codable {
    let access_token : String
    let scope : String
    let token_type : String
}
