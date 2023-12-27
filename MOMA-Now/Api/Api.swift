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
    
    private init() {
        
    }
}
