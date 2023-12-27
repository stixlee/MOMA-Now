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
            let response = try? await api.getObjects()
            print()
        }
    }
}

#Preview {
    ContentView()
}
