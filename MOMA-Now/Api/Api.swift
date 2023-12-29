//
//  Api.swift
//  MOMA-Now
//
//  Created by Michael Lee on 12/27/23.
//

import Foundation

let api = Api.shared
class Api {
    static fileprivate let shared = Api()
    
    let baseUrlPath = "https://collectionapi.metmuseum.org"
    let blockSize = 24
    
    
    var IdBlockStartIndex = -1
    var IdBlockEndIndex = -1
    
    var ids: [Int] = []
    
    private init() {
        self.IdBlockStartIndex = 0
        self.IdBlockEndIndex = self.IdBlockStartIndex + blockSize
    }
    
    var nextBlock: [Int]? {
        let slice = ids[IdBlockStartIndex...IdBlockEndIndex]
        return Array(slice)
    }
}
