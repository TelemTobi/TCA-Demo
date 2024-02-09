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
            switch store.presentation {
            case .splash:
                store.scope(state: \.presentation.splash,action: \.presentation.splash)
                    .map(SplashView.init)
                
            case .login:
                EmptyView()
                
            case .home:
                EmptyView()
            }
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
