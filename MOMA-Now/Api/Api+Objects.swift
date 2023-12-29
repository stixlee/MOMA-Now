//
//  Api+Objects.swift
//  MOMA-Now
//
//  Created by Michael Lee on 12/27/23.
//

import Foundation

enum ApiError: Error {
    case invalidResponse
    case invalidJSON
    case invalidRequest
}

extension Api {
    
    func getCollection() async throws -> ArtCollection {
        guard let request = buildGetRequest(endPoint: "/public/collection/v1/objects") else {
            throw ApiError.invalidRequest
        }
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
           throw ApiError.invalidResponse
        }
        guard let collection = try? JSONDecoder().decode(ArtCollection.self, from: data) else {
            throw ApiError.invalidJSON
        }
        return collection
    }
    func getCollection(for departmentId: Int) async throws -> ArtCollection {
        guard let request = buildGetRequest(
            endPoint: "/public/collection/v1/objects",
            headers: nil,
            parameters: ["departmentIds" : "\(departmentId)"]
        ) else { throw ApiError.invalidRequest }
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
           throw ApiError.invalidResponse
        }
        guard let collection = try? JSONDecoder().decode(ArtCollection.self, from: data) else {
            throw ApiError.invalidJSON
        }
        return collection
    }

    
//    func getObjectsIn(department id: Int) async throws -> ArtCollection? {
//        let fullPath = baseUrlPath+"/public/collection/v1/objects?departmentIds=\(id)"
//        guard let url = URL(string: fullPath) else { return nil }
//        print("url: \(url.absoluteString)")
//        let (data, response) = try await URLSession.shared.data(from: url)
//        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
//           throw ApiError.invalidResponse
//        }
//        return try? JSONDecoder().decode(ArtCollection.self, from: data)
//    }
//    
//    func getObject(with id: Int) async throws -> WorkOfArt? {
//        let fullPath = baseUrlPath+"/public/collection/v1/objects/\(id)"
//        guard let url = URL(string: fullPath) else { return nil }
//        let (data, response) = try await URLSession.shared.data(from: url)
//        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
//            throw ApiError.invalidResponse
//        }
//        do {
//            let woa = try JSONDecoder().decode(WorkOfArt.self, from: data)
//            return woa
//        } catch (let error ){
//            print(error)
//            throw ApiError.invalidJSON
//        }
//    }
    
//    func getObjectsWithImage() async throws -> [WorkOfArt] {
//        let objects = try? await getObjects()
//        guard let objectIDs = objects?.objectIDs, objectIDs.count > 0 else { return [] }
//
//        var objectList: [WorkOfArt] = []
//        for index in 0..<1000 {
//            if let woa = try? await getObject(with: objectIDs[index]) {
//                if !woa.primaryImage.isEmpty {
//                    objectList.append(woa)
//                    print("Hit: \(woa.objectID)")
//                }
//            }
//        }
//        return objectList
//    }


}
