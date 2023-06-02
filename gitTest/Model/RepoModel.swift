//
//  RepoModel.swift
//  gitTest
//
//  Created by Ardak Tursunbayev on 01.06.2023.
//

import Foundation

struct RepoModelByName : Codable, Hashable{
    let items : [RepoModel]
}

struct RepoModel : Codable, Hashable{
    let full_name: String
    let html_url : String
    let description : String?
}
