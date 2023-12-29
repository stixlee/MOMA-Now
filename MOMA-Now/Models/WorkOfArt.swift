//
//  WorkOfArt.swift
//  MOMA-Now
//
//  Created by Michael Lee on 12/27/23.
//

import Foundation

struct WorkOfArt: Codable {
    let objectID: Int
    let isHighlight: Bool
    let accessionNumber: String
    let accessionYear: String
    let isPublicDomain: Bool
    let primaryImage: String
    let primaryImageSmall: String
    let additionalImages: [String]
    let department: String
    let objectName: String
    let title: String
    let culture: String
    let period: String
    let dynasty: String
    let reign: String
    let portfolio: String
    let artistRole: String
    let artistPrefix: String
}
