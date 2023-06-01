//
//  RepoModel.swift
//  gitTest
//
//  Created by Ardak Tursunbayev on 01.06.2023.
//

import Foundation

struct RepoModelByName : Decodable, Hashable{
    let items : [RepoModel]
}

struct RepoModel : Decodable, Hashable{
    let full_name: String
    let html_url : String
    let description : String?
}
