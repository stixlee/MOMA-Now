//
//  ContentView.swift
//  MOMA-Now
//
//  Created by Michael Lee on 12/27/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .task {
            do {
                let response = try await api.getCollection(for: 3)
                print()
            } catch (let error) {
                print(error)
            }
//            let list = try? await api.getObjectsWithImage()
//            let response = try? await api.getObject(with: 47112)
//            print()
//            guard let departments = response?.departments else { return }
//            for department in departments {
//                print("Department Id: \(department.departmentId) | Name: \(department.displayName)")
//            }
        }
    }
}

#Preview {
    ContentView()
}
