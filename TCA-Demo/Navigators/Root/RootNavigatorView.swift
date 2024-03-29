//
//  RootNavigatorView.swift
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
                store.scope(state: \.presentation.splash, action: \.presentation.splash)
                    .map(SplashView.init)
                
            case .login:
                store.scope(state: \.presentation.login, action: \.presentation.login)
                    .map(LoginNavigator.ContentView.init)
                
            case .home:
                store.scope(state: \.presentation.home, action: \.presentation.home)
                    .map(HomeNavigator.ContentView.init)
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
