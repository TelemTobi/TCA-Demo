//
//  TCA_DemoApp.swift
//  TCA-Demo
//
//  Created by Telem Tobi on 09/02/2024.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCA_DemoApp: App {
    var body: some Scene {
        WindowGroup {
            RootNavigator.ContentView(
                store: .init(
                    initialState: RootNavigator.State(),
                    reducer: RootNavigator.init
                )
            )
        }
    }
}
