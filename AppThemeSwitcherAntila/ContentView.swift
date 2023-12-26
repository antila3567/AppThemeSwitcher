//
//  ContentView.swift
//  AppThemeSwitcherAntila
//
//  Created by Иван Легенький on 26.12.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var changeTheme: Bool = false
    @AppStorage("userTheme") private var userTheme: Theme = .systemDefault
    @Environment(\.colorScheme) private var scheme
    var body: some View {
        NavigationStack {
            List {
                Section("Appearance") {
                    Button("Change theme") {
                        changeTheme.toggle()
                    }
                }
            }
            .navigationTitle("Settings")
        }
        .preferredColorScheme(userTheme.colorScheme)
        .sheet(isPresented: $changeTheme, content: {
            ThemeSwitcherView(scheme: scheme)
                .presentationDetents([.height(410)])
                .presentationBackground(.clear)
        })
    }
}

#Preview {
    ContentView()
}
