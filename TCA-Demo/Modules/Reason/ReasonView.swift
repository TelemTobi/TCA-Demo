//
//  ReasonView.swift
//  TCA-Demo
//
//  Created by Telem Tobi on 07/02/2024.
//

import SwiftUI
import ComposableArchitecture

struct ReasonView: View {
    
    let store: StoreOf<ReasonReducer>
    
    @Environment(\.themeColor) private var themeColor
    
    var body: some View {
        VStack {
            Spacer()
            
            Button(
                action: { store.send(.didSelectReason("some reason")) },
                label: {
                    Text("Continue")
                        .bold()
                        .frame(height: 45)
                        .frame(maxWidth: .infinity)
                }
            )
            .tint(themeColor)
            .buttonStyle(.borderedProminent)
            .padding(.horizontal)
        }
        .navigationTitle("Reason")
    }
}

#Preview {
    NavigationStack {
        ReasonView(
            store: .init(
                initialState: ReasonReducer.State(),
                reducer: { ReasonReducer() }
            )
        )
    }
}
