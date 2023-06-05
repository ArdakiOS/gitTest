//
//  Extensions.swift
//  gitTest
//
//  Created by Ardak Tursunbayev on 04.06.2023.
//

import Foundation

extension URL {
    func valueOf(_ queryParameterName: String) -> String? {
        guard let url = URLComponents (string: self.absoluteString) else { return nil }
        return url.queryItems?.first (where: { $0 .name == queryParameterName })?.value
    }
}



