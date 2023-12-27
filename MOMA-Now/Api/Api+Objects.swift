//
//  Api+Objects.swift
//  MOMA-Now
//
//  Created by Michael Lee on 12/27/23.
//

import Foundation

enum ApiError: Error {
    case invalidResponse
}

extension Api {
    
    func getObjects() async throws -> ObjectsResponse? {
        let fullPath = baseUrlPath+"/public/collection/v1/objects"
        guard let url = URL(string: fullPath) else { return nil }
        print("url: \(url.absoluteString)")
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
           throw ApiError.invalidResponse
        }
        return try? JSONDecoder().decode(ObjectsResponse.self, from: data)
    }
    
}
