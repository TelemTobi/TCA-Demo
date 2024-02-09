//
//  HomeNavigatorView.swift
//  TCA-Demo
//
//  Created by Telem Tobi on 09/02/2024.
//

import SwiftUI
import ComposableArchitecture

extension HomeNavigator {
    struct ContentView: View {
        
        @Bindable var store: StoreOf<HomeNavigator>
        
        var body: some View {
            HomeView(store: store.scope(state: \.root, action: \.root))
//                .fullScreenCover(
//                    item: <#T##Binding<Identifiable?>#>,
//                    content: <#T##(Identifiable) -> View#>
//                )
        }
    }
}

#Preview {
    HomeNavigator.ContentView(
        store: .init(
            initialState: HomeNavigator.State(),
            reducer: HomeNavigator.init
        )
    )
}
