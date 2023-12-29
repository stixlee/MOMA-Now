//
//  Api+RequestBuilders.swift
//  MOMA-Now
//
//  Created by Michael Lee on 12/29/23.
//

import Foundation

extension Api {
    
    func buildGetRequest(endPoint: String, headers: [String : String]? = nil, parameters: [String : String]? = nil) -> URLRequest? {
        var requestString = baseUrlPath+endPoint
        if let parms = parameters {
            var parametersString = ""
            for name in parms.keys {
                if let value = parms[name] {
                    parametersString = parametersString+"?\(name)=\(value)"
                }
            }
            requestString = requestString+parametersString
        }
        guard let url = URL(string: requestString) else { return nil }
        var request = URLRequest(url: url)
        if let headers = headers {
            for name in headers.keys {
                if let value = headers[name] {
                    request.setValue(value, forHTTPHeaderField: name)
                }
            }
        }
        return request
    }
    
}
