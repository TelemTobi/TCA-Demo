//
//  RootContentView.swift
//  TCA-Demo
//
//  Created by Telem Tobi on 09/02/2024.
//

import SwiftUI
import ComposableArchitecture

extension RootNavigator {
    struct ContentView: View {
        
        let store: StoreOf<RootNavigator>
        
        var body: some View {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    RootNavigator.ContentView(
        store: .init(
            initialState: RootNavigator.State(),
            reducer: RootNavigator.init
        )
    )
}
