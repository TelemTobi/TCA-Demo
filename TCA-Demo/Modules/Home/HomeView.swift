//
//  HomeView.swift
//  TCA-Demo
//
//  Created by Telem Tobi on 09/02/2024.
//

import SwiftUI
import ComposableArchitecture

struct HomeView: View {
    
    let store: StoreOf<HomeReducer>
    
    var body: some View {
        VStack {
            Button(
                action: { store.send(.onTransferTap) },
                label: {
                    Label("Transfer", systemImage: "arrow.up.right")
                }
            )
            .tint(.pink)
            
            Button(
                action: { store.send(.onRequestTap) },
                label: {
                    Label("Request", systemImage: "arrow.down.left")
                }
            )
            .tint(.teal)
        }
        .bold()
        .buttonStyle(.borderedProminent)
        .navigationTitle("Home")
    }
}

#Preview {
    NavigationStack {
        HomeView(
            store: .init(
                initialState: HomeReducer.State(),
                reducer: HomeReducer.init
            )
        )
    }
}
