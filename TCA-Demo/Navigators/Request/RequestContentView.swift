//
//  RequestContentView.swift
//  TCA-Demo
//
//  Created by Telem Tobi on 08/02/2024.
//

import SwiftUI
import ComposableArchitecture

extension RequestNavigator {
    
    struct ContentView: View {
        
        @Bindable var store: StoreOf<RequestNavigator>
        
        var body: some View {
            NavigationStack(
                path: $store.scope(state: \.path, action: \.path),
                root: {
                    AmountView(store: store.scope(state: \.root, action: \.root))
                        .toolbar(content: toolbarContent)
                },
                destination: { store in
                    Group {
                        switch store.state {
                        case .contacts:
                            if let store = store.scope(state: \.contacts, action: \.contacts) {
                                ContactsView(store: store)
                            }
                            
                        case .reason:
                            if let store = store.scope(state: \.reason, action: \.reason) {
                                ReasonView(store: store)
                            }
                        }
                    }
                    .toolbar(content: toolbarContent)
                }
            )
            .environment(\.themeColor, .teal)
        }
        
        @ToolbarContentBuilder
        private func toolbarContent() -> some ToolbarContent {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(
                    action: { store.send(.didTapClose) },
                    label: { Image(systemName: "xmark") }
                )
            }
            
            ToolbarItem(placement: .principal) {
                VStack {
                    Text("Request")
                        .fontWeight(.bold)
                    
                    Text(store.subtitle)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}
