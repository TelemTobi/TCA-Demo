//
//  TransferContentView.swift
//  TCA-Demo
//
//  Created by Telem Tobi on 06/02/2024.
//

import SwiftUI
import ComposableArchitecture

extension TransferNavigator {
    
    struct ContentView: View {
        
        @Bindable var store: StoreOf<TransferNavigator>
        
        var body: some View {
            NavigationStack(
                path: $store.scope(state: \.path, action: \.path),
                root: {
                    ContactsView(store: store.scope(state: \.root, action: \.root))
                        .toolbar(content: toolbarContent)
                },
                destination: { store in
                    Group {
                        switch store.state {
                        case .amount:
                            if let store = store.scope(state: \.amount, action: \.amount) {
                                AmountView(store: store)
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
            .environment(\.themeColor, .pink)
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
                    Text("Transfer")
                        .fontWeight(.bold)
                    
                    Text(store.subtitle)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}
