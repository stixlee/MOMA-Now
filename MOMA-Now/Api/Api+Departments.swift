//
//  Api+Departments.swift
//  MOMA-Now
//
//  Created by Michael Lee on 12/27/23.
//

import Foundation

extension Api {
    
    func getDepartments() async throws -> DepartmentsResponse? {
        let fullPath = baseUrlPath+"/public/collection/v1/departments"
        guard let url = URL(string: fullPath) else { return nil }
        print("url: \(url.absoluteString)")
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
           throw ApiError.invalidResponse
        }
        return try? JSONDecoder().decode(DepartmentsResponse.self, from: data)
    }
    
}
