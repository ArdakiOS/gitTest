//
//  UserModel.swift
//  gitTest
//
//  Created by Ardak Tursunbayev on 01.06.2023.
//

import Foundation

struct UserModelResponse : Decodable{
    let items : [UserModel]
}

struct UserModel : Decodable, Hashable{
    let login : String
    let avatar_url : String
    let html_url : String
    let repos_url : String
}
