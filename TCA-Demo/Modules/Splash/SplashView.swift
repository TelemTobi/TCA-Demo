//
//  SplashView.swift
//  TCA-Demo
//
//  Created by Telem Tobi on 09/02/2024.
//

import SwiftUI
import ComposableArchitecture

struct SplashView: View {
    
    let store: StoreOf<SplashReducer>
    
    var body: some View {
        Text("Splash")
            .font(.largeTitle.bold())
    }
}

#Preview {
    SplashView(
        store: .init(
            initialState: SplashReducer.State(),
            reducer: SplashReducer.init
        )
    )
}
