//
//  ObjectsResponse.swift
//  MOMA-Now
//
//  Created by Michael Lee on 12/27/23.
//

import Foundation

struct ObjectsResponse: Codable {
    let total: Int
    let objectIDs: [Int]
}
