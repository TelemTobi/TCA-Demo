//
//  ContactsView.swift
//  TCA-Demo
//
//  Created by Telem Tobi on 06/02/2024.
//

import SwiftUI
import ComposableArchitecture

struct ContactsView: View {
    
    let store: StoreOf<ContactsReducer>
    
    @Environment(\.themeColor) private var themeColor
    
    var body: some View {
        VStack {
            Spacer()
            
            Button(
                action: { store.send(.didSelectContact("Telem Tobi")) },
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
        .navigationTitle("Contacts")
        .onAppear { store.send(.onAppear)}
    }
}

#Preview {
    NavigationStack {
        ContactsView(
            store: .init(
                initialState: ContactsReducer.State(),
                reducer: { ContactsReducer() }
            )
        )
    }
}
