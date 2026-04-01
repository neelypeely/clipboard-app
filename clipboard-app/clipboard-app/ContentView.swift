//
//  ContentView.swift
//  clipboard-app
//
//  Created by Neel Deshpande on 3/31/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Clipboard")
                    .font(.headline)
                Spacer()
                Button("Clear All") {
                    
                }
                .buttonStyle(.borderless)
                .foregroundColor(.red)
            }
            .padding()
            Divider()
            Spacer()
        }
        .frame(width: 320, height: 480)
    }
}
