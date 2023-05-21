//
//  cloneMLApp.swift
//  cloneML
//


import SwiftUI

@main
struct cloneMLApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(classifier: ImageClassifier())
        }
    }
}
