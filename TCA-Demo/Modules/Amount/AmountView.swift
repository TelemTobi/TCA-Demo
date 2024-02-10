//
//  AmountView.swift
//  TCA-Demo
//
//  Created by Telem Tobi on 06/02/2024.
//

import SwiftUI
import ComposableArchitecture

struct AmountView: View {
    
    let store: StoreOf<AmountReducer>
    
    @Environment(\.themeColor) private var themeColor
    
    var body: some View {
        VStack {
            Spacer()
            
            Button(
                action: { store.send(.didSelectAmount(50)) },
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
        .navigationTitle("Amount")
    }
}

#Preview {
    NavigationStack {
        AmountView(
            store: .init(
                initialState: AmountReducer.State(),
                reducer: { AmountReducer() }
            )
        )
    }
}
