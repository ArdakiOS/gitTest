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
    let stargazers_count : Int
    let updated_at : String
    
    
    enum CodingKeys : CodingKey{
        case full_name
        case html_url
        case description
        case stargazers_count
        case updated_at
        
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.full_name = try container.decode(String.self, forKey: .full_name)
        self.html_url = try container.decode(String.self, forKey: .html_url)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.stargazers_count = try container.decode(Int.self, forKey: .stargazers_count)
        self.updated_at = try container.decode(String.self, forKey: .updated_at)
        
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(full_name, forKey: .full_name)
        try container.encode(html_url, forKey: .html_url)
        try container.encode(description, forKey: .description)
        try container.encode(stargazers_count, forKey: .stargazers_count)
        try container.encode(updated_at, forKey: .updated_at)
    }
}
