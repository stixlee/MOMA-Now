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
            let response = try? await api.getObjects(19)
            print()
//            guard let departments = response?.departments else { return }
//            for department in departments {
//                print("Department Id: \(department.departmentId) | Name: \(department.departmentId)")
//            }
        }
    }
}

#Preview {
    ContentView()
}
